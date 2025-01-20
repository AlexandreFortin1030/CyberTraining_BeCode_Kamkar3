### Mission:
##---> Collect all the quotes from the following url:
# http://www.values.com/inspirational-quotes
#-----------------------------------------------------

import requests
from bs4 import BeautifulSoup
import csv

# Gets the url into a variable
URL = "http://www.values.com/inspirational-quotes"
# Store the request's response into "r" variable
r = requests.get(URL)

print(URL, r.status_code)

# The content of the r variable gets parsed as it becomes a BeautifulSoup object
soup = BeautifulSoup(r.content, 'html5lib')
# Object which is then formated by the prettify() method
print(soup.prettify())

# Now that we got the whole html code from the initial url formated, we want to extract the quotes from it.

# We create an empty list to store them
quotes = []

# Retreieving the content of all div element with id : all_quotes. This si based upon html page's examination
div_allquotes = soup.find('div', attrs = {'id':'all_quotes'})

# if need is to print the result, it has to be formated before since it is a BeautifulSoup object.
# print(div_allquotes.prettify())

# Now we want to organise all we got into dictionnaries that will then be saved into the "quotes" variable bellow
# So we itare over every occurence of divs with the special attribute and dissect the result to fit our dictionary's categories
for row in div_allquotes.findAll('div', attrs = {'class':'col-6 col-lg-3 text-center margin-30px-bottom sm-margin-30px-top'}):
    quote = {}
    quote['theme'] = row.h5.text
    quote['url'] = row.a['href']
    quote['img'] = row.img['src']
    quote['lines'] = row.img['alt'].split(" #")[0]
    quote['author'] = row.img['alt'].split(" #")[1]
    quotes.append(quote)

# We can access the main list and print all the quotes from it
# for each in quotes:
    # print(each['lines'])

# We save the result in a .csv file
filename = 'inspirational_quotes.csv'
with open(filename, 'w', newline='') as f:
    w = csv.DictWriter(f,['theme','url','img','lines','author'])
    w.writeheader()
    for quote in quotes:
        w.writerow(quote)