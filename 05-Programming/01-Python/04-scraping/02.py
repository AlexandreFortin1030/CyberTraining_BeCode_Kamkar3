from bs4 import BeautifulSoup

becode_file = "./becode.html"
file = open(becode_file, "r")

html_doc = file.read()
file.close()
html_doc

soup = BeautifulSoup(html_doc, "html5lib")

# Bellow we can change the html element to access any of them like h1, h2 etc
for tag in soup.findAll("p"):
    print(tag.text)