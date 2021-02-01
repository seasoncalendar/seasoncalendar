import sqlite3
import sys, os, glob, json
from collections import OrderedDict

# IMPORTANT: execute this script from the seasoncalendar root directory!
sys.path.append(".")

# PART 1: DB READING
# ------------------

# prep
os.chdir("assets")
conn = sqlite3.connect("db/foods.db")
cursor = conn.execute("SELECT name FROM sqlite_master WHERE type='table';")
all_food_ids = []
db_lang_dicts = dict()

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
    db_lang_dicts[lang_code] = cur_lang_dict

# sort out duplicate keys
all_food_ids = sorted(list(set(all_food_ids)))

conn.close()

# PART 2: ARB APPENDING
# ---------------------

# prep
os.chdir("../lib/l10n")
all_keys = []

arb_lang_dicts = dict()

# get dicts of existing ARB files
for lang_code in db_lang_dicts.keys():
    with open(os.path.join(os.getcwd(), "intl_{}.arb".format(lang_code))) as arb_file:
        arb_lang_dicts[lang_code] = json.load(arb_file)

# retrieve and remove old ARB files
for arb_fp in glob.glob("*.arb"):
    print("file \'{}\' already exists, replacing it...".format(arb_fp))
    #os.remove(arb_fp)

# merge existing ARB file dicts with corresponding DB dicts
for lang_code in db_lang_dicts.keys():
    with open("intl_{}.arb".format(lang_code), "w") as arb_file:
        merged_dict = db_lang_dicts[lang_code] | arb_lang_dicts[lang_code]
        json.dump(dict(sorted(merged_dict.items(), key=lambda item: item[0])),
                  arb_file, indent=4)