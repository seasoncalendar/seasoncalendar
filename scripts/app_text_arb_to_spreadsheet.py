import sys, glob, os, time
import json
import xlsxwriter

# IMPORTANT: execute this script from the seasoncalendar root diractory!
sys.path.append(".")

# prep
os.chdir("lib/l10n")
arb_dicts = dict()
all_keys = []

# retrieve all keys and the language data
for arb_file in glob.glob("*.arb"):
    with open(arb_file) as f:
        json_result = json.load(f)
    cur_arb_dict = dict()
    cur_keys = [key.replace("@", "") for key in json_result.keys()]
    cur_keys.remove("locale")  # @@locale is not included
    if "en" in arb_file:  # only consider those entries that are also present in the english resource
        all_keys = cur_keys

    cur_lang_code = arb_file[-6:-4]  # the two letter ISO code
    arb_dicts[cur_lang_code] = json_result

# create list objects for iteration
all_keys = sorted(list(set(all_keys)))
all_lang_codes = sorted(list(arb_dicts.keys()))

# create and write the worksheet from the fetched data
os.chdir("../..")
spreadsheet_file_name = "assets/i18n_data/app_text.xlsx"
if os.path.isfile(spreadsheet_file_name):
    print("file \'{}\' already exists, marking it as old...".format(spreadsheet_file_name))
    os.rename(src=spreadsheet_file_name, dst=spreadsheet_file_name[:-5] + "_old_{}.xlsx".format(
        time.strftime('%d-%b-%Y-%Hh-%Mm-%Ss')))

with xlsxwriter.Workbook(spreadsheet_file_name) as workbook:
    for lang_code in all_lang_codes:

        # add new worksheet
        worksheet = workbook.add_worksheet(lang_code)

        # add first row information
        worksheet.write(0, 1, "key")
        worksheet.write(0, 2, "description")
        worksheet.write(0, 3, lang_code)

        # add entries
        for i in range(len(all_keys)):

            # the key
            key = all_keys[i]
            worksheet.write(1 + i, 1, key)

            # the description entry of the english file, defaulting to ""
            value = arb_dicts["en"].get("@" + key, None)
            description = "" if value is None else value["description"]
            worksheet.write(1 + i, 2, description)

            # the actual language entry for the key
            entry_data = arb_dicts[lang_code].get(key, "")
            worksheet.write(1 + i, 3, entry_data)
