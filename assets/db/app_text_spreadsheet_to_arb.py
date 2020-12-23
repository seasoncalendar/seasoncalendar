import sys, glob, os
import json
import xlsxwriter
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
    all_keys.extend(cur_keys)

    cur_lang_code = arb_file[-6:-4]  # the two letter ISO code
    arb_dicts[cur_lang_code] = json_result

# create list objects for iteration
all_keys = sorted(list(set(all_keys)))
all_lang_codes = sorted(list(arb_dicts.keys()))

# create and write the worksheet from the fetched data
os.chdir("../..")
with xlsxwriter.Workbook("assets/db/app_texts.xlsx") as workbook:

    for j in range(len(all_lang_codes)):

        # add new worksheet
        cur_lang_code = all_lang_codes[j]
        worksheet = workbook.add_worksheet("app_text_" + cur_lang_code)

        # add first row information
        worksheet.write(0, 1, "key")
        worksheet.write(0, 2, "description")
        worksheet.write(0, 3, cur_lang_code)

        # add entries
        for i in range(len(all_keys)):

            # the key
            key = all_keys[i]
            worksheet.write(1+i, 1, key)

            # the description entry of the english file, defaulting to ""
            value = arb_dicts["en"].get("@" + key, None)
            description = "" if value is None else value["description"]
            worksheet.write(1+i, 2, description)

            # the actual language entry for the key
            entry_data = arb_dicts[cur_lang_code].get(key, "")
            worksheet.write(1+i, 3, entry_data)