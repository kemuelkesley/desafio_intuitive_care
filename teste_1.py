import requests
import zipfile
from bs4 import BeautifulSoup

URL = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"

def search_pdf(url):   
    response = requests.get(url)
    soup = BeautifulSoup(response.text, "html.parser")
    
    pdf_links = []

    for link in soup.find_all("a", href=True):
        href = link["href"]

        if ("Anexo_I" in href or "Anexo_II" in href) and href.endswith(".pdf"):         
            pdf_links.append(href)           
       
    
    return pdf_links


def download_pdf(pdf_links):    
    download_file = []
    
    for index, url in enumerate(pdf_links, start=1):
        file_name = f"Anexo_{index}.pdf"
        print(f"🫸 Baixando: {file_name}")
        
        response = requests.get(url)
        with open(file_name, "wb") as file:
            file.write(response.content)
        
        download_file.append(file_name)
    
    return download_file


def create_zip(pdf_files, zip_name="pdf.zip"):    
    with zipfile.ZipFile(zip_name, "w") as file_zip:
        for file_name in pdf_files:
            file_zip.write(file_name)

    print(f"👍 Download  dos PDF concluidos")
    print(f"👍 Arquivo compactado como: {zip_name}")


pdf_links = search_pdf(URL)

if not pdf_links:
    print("PDF não encontrado no site.")
else:
    pdf_files = download_pdf(pdf_links)
    create_zip(pdf_files)
