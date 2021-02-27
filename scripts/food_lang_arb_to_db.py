import sys, glob, os, time
import json
import sqlite3

# IMPORTANT: execute this script from the seasoncalendar root directory!
sys.path.append(".")

# prep
os.chdir("lib/l10n")
arb_dicts = dict()
all_lang_codes = []

# retrieve all ARB dicts
for arb_file in glob.glob("*.arb"):
    with open(arb_file) as f:
        json_result = json.load(f)

    cur_lang_code = arb_file[5:-4]  # the ISO code, either two-letter or with country
    arb_dicts[cur_lang_code] = json_result
    all_lang_codes.append(cur_lang_code)

# PART 2: DB WRITING
# ------------------


os.chdir("../../assets")
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
    print("table \'{}\' already exists, removing...".format(table_name))
    cursor = conn.cursor()
    cursor.execute("DROP TABLE `{}`".format(table_name))



# create new tables
for lang_code in all_lang_codes:
    cur_arb_dict = arb_dicts[lang_code]

    # create table
    cursor.execute(create_statement.format(lang_code))

    # get food keys
    food_keys = list(set(
        [key.split("_")[0].replace("@", "") for key in cur_arb_dict.keys() if ("_infoUrl" in key or "_names" in key)]))


    # add all food entries to table
    for food_key in food_keys:
        cursor.execute(insert_statement.format(lang_code), (food_key, cur_arb_dict.get(food_key + "_infoUrl", "NONE"),
                                                            cur_arb_dict.get(food_key + "_names", "NONE")))

conn.close()


