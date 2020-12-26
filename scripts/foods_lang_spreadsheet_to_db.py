import sys, os
import time
import pandas as pd
import sqlite3

# IMPORTANT: execute this script from the seasoncalendar root diractory!
sys.path.append(".")

# PART 1: XLSX READING
# --------------------

# prep
os.chdir("assets")
lang_dicts = dict()
sheets_dict = pd.read_excel("i18n_data/foods_lang.xlsx", sheet_name=None, engine='openpyxl')
all_lang_codes = list(sheets_dict.keys())

all_food_ids = []

# get foods_lang dict data for each language sheet
for lang_code in all_lang_codes:
    cur_frame = sheets_dict[lang_code].fillna("NONE")  # pd.DataFrame
    cur_arb_dict = dict()

    for index, row in cur_frame.iterrows():
        cur_id = row[1]
        cur_arb_dict[cur_id + "_infoUrl"] = row[2]
        cur_arb_dict[cur_id + "_names"] = row[3]
        all_food_ids.append(cur_id)

    lang_dicts[lang_code] = cur_arb_dict

# sort out duplicate food ids
all_food_ids = sorted(list(set(all_food_ids)))

# PART 2: DB WRITING
# ------------------

conn = sqlite3.connect("db/foods.db", isolation_level=None)  # auto-commit on
cursor = conn.execute("SELECT name FROM sqlite_master WHERE type='table';")
db_lang_table_names = [table[0] for table in cursor.fetchall() if "foods_lang" in table[0] and not "old" in table[0]]

# TODO these statements are vulnerable to SQL injection -> Problematic?
create_statement = """CREATE TABLE "foods_lang_{}" (
	                    "id"	TEXT NOT NULL UNIQUE,
	                    "infoUrl"	TEXT,
	                    "foodnames"	TEXT,
	                    PRIMARY KEY("id"))"""

insert_statement = """INSERT INTO foods_lang_{} values (?, ?, ?)"""

# move old tables
for table_name in db_lang_table_names:
    print("table \'{}\' already exists, marking it as old...".format(table_name))
    cursor = conn.cursor()
    cursor.execute(
        "ALTER TABLE `{}` RENAME TO `{}_old_{}`".format(table_name, table_name, time.strftime('%d-%b-%Y-%Hh-%Mm-%Ss')))

# create new tables
for lang_code in all_lang_codes:
    cur_lang_dict = lang_dicts[lang_code]

    # create table
    cursor.execute(create_statement.format(lang_code))

    # add all food entries to table
    for id in all_food_ids:
        cur_info_url = cur_lang_dict.get(id + "_infoUrl", "")
        cur_food_names = cur_lang_dict.get(id + "_names", "UNKNOWN")
        a = insert_statement.format(lang_code)
        cursor.execute(insert_statement.format(lang_code), (id, cur_info_url, cur_food_names))

conn.close()
