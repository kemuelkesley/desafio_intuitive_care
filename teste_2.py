import pandas as pd
import zipfile
import pdfplumber


PDF_FILE = "Anexo_1.pdf"
CSV_FILE = "Teste_kemuel_kesley.csv"
ZIP_FILE = "Teste_kemuel_kesley.zip"

REPLACEMENTS = {"OD": "Odontológico", "AMB": "Ambulatorial"}


COLUMNS = [
    "PROCEDIMENTO", "RN (alteração)", "VIGÊNCIA", "OD", "AMB",
    "HCO", "HSO", "REF", "PAC", "DUT", "SUBGRUPO", "GRUPO", "CAPÍTULO"
]


def extract_pdf_tables(pdf_file):
    data = []
    with pdfplumber.open(pdf_file) as pdf:
        for page in pdf.pages:
            table = page.extract_table()
            if table:
                for row in table:
                    if len(row) == len(COLUMNS):
                        data.append(row)
    return data


table_data = extract_pdf_tables(PDF_FILE)

df = pd.DataFrame(table_data, columns=COLUMNS).replace(REPLACEMENTS)

df.to_csv(CSV_FILE, index=False, encoding='utf-8-sig')


with zipfile.ZipFile(ZIP_FILE, 'w', zipfile.ZIP_DEFLATED) as zip_files:
    zip_files.write(CSV_FILE)

print(f"😁 Processo concluído! Arquivo salvo como {ZIP_FILE}")
