import sqlite3
import time, sys, os
import xlsxwriter

# IMPORTANT: execute this script from the seasoncalendar root directory!
sys.path.append(".")

# PART 1: DB READING
# ------------------

# prep
os.chdir("assets")
conn = sqlite3.connect("db/foods.db")
cursor = conn.execute("SELECT name FROM sqlite_master WHERE type='table';")
all_food_ids = []
lang_dicts = dict()

# iterate over all languages
all_lang_codes = [table[0][-2:] for table in cursor.fetchall() if "foods_lang" in table[0]]
for lang_code in all_lang_codes:

    # get cur language data
    cursor = conn.execute("SELECT * from foods_lang_{}".format(lang_code))
    cur_lang_data = cursor.fetchall()
    cur_lang_dict = dict()

    # add keys to big list (duplicates are sorted out later)
    all_food_ids.extend([entry[0] for entry in cur_lang_data])

    # fill current data dict with names and info URLs
    for entry in cur_lang_data:
        cur_lang_dict[entry[0] + "_infoUrl"] = entry[1]
        cur_lang_dict[entry[0] + "_names"] = entry[2]

    # add cur dict to dict dict
    lang_dicts[lang_code] = cur_lang_dict

# sort out duplicate keys
all_food_ids = sorted(list(set(all_food_ids)))

conn.close()

# PART 2: XLSX WRITING
# --------------------

spreadsheet_file_name = "i18n_data/foods_lang.xlsx"
if os.path.isfile(spreadsheet_file_name):
    print("file \'{}\' already exists, marking it as old...".format(spreadsheet_file_name))
    os.rename(src=spreadsheet_file_name, dst=spreadsheet_file_name[:-5] + "_old_{}.xlsx".format(
        time.strftime('%d-%b-%Y-%Hh-%Mm-%Ss')))

with xlsxwriter.Workbook(spreadsheet_file_name) as workbook:
    for lang_code in all_lang_codes:

        # add new worksheet
        worksheet = workbook.add_worksheet(lang_code)

        # add first row information
        worksheet.write(0, 1, "id")
        worksheet.write(0, 2, "infoUrl (Wikipedia etc.)")
        worksheet.write(0, 3, "names (separated by commas, first name is also the name displayed in app)")

        cur_lang_dict = lang_dicts[lang_code]

        # add entries
        for i in range(len(all_food_ids)):

            # the key
            key = all_food_ids[i]
            worksheet.write(1+i, 1, key)

            # the infoURL
            info_url = cur_lang_dict.get(key + "_infoUrl", "")
            worksheet.write(1+i, 2, info_url)

            # the actual language entry for the key
            food_names = cur_lang_dict.get(key + "_names", "")
            worksheet.write(1+i, 3, food_names)
