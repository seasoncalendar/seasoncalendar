import sys, glob, os
import json
import pandas as pd
sys.path.append(".")

# prep
arb_dicts = dict()
sheets_dict = pd.read_excel("assets/db/app_text.xlsx", sheet_name=None, engine='openpyxl')
lang_codes = list(sheets_dict.keys())

# get ARB dict data for each language sheet
for lang_code in lang_codes:
    cur_frame = sheets_dict[lang_code].fillna("NONE")  # pd.DataFrame
    cur_arb_dict = dict({"@@locale": lang_code})

    for index, row in cur_frame.iterrows():
        cur_arb_dict[row['key']] = row[lang_code]
        if lang_code == 'en':
            cur_arb_dict["@" + row['key']] = dict({"description": row['description']})

    arb_dicts[lang_code] = cur_arb_dict


os.chdir("lib/l10n")

# retrieve and move old ARB files
for arb_fp in glob.glob("*.arb"):
    print("file \'{}\' already exists, replacing it...".format(arb_fp))
    os.remove(arb_fp)

# save ARB dicts to fresh ARB files
for lang_code in arb_dicts.keys():
    with open("intl_{}.arb".format(lang_code), "w") as arb_file:
        json.dump(arb_dicts[lang_code], arb_file, indent=4)