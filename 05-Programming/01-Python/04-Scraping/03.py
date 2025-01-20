### Mission:
##---> Collect all the movie titles and descriptions from the following url:
# http://www.allocine.fr/film/aucinema/
#-----------------------------------------------------

# importing libraries
import requests
from bs4 import BeautifulSoup
import csv

# storing the url in a variable, making a get request to it and storing the html in the soup variable.
url = "http://www.allocine.fr/film/aucinema/"
r = requests.get(url)
print(url, r.status_code)
soup = BeautifulSoup(r.content, "html5lib")

movies = []

# getting the main html containers for movies
movie_entity_cards = soup.findAll('div', attrs = {'class':'card entity-card entity-card-list cf'})

# for each of the containers, we retrieve title and description
for card in movie_entity_cards:
    movie = {}
    a_title = card.find('a', attrs = {'class':'meta-title-link'})
    if a_title:
        movie['title'] = a_title.text.strip()

    div_descr = card.find('div', attrs = {'class':'content-txt'})
    if div_descr:
        movie['description'] = div_descr.text.strip()
    
    if 'title' in movie and 'description' in movie:
        movies.append(movie)



# Specify the CSV file name
csv_file = 'movies.csv'

# Write the data to a CSV file
with open(csv_file, mode='w', newline='', encoding='utf-8') as file:
    writer = csv.DictWriter(file, fieldnames=['title', 'description'])
    writer.writeheader()  # Write the header
    writer.writerows(movies)  # Write the movie data

print(f"Data saved to {csv_file}")




