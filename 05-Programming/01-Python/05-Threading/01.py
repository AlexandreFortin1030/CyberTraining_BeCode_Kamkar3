### The goal here is to find and write a program that illustrates best the way threading works in python

import threading
import time

start_time = time.time()


def sortir_chien(name):
    time.sleep(5)
    print(f"Le chien {name} est sorti")

def nettoyer_litiere(chat):
    time.sleep(4)
    print(f"La litière de {chat} est propre")

def faire_liste_course():
    time.sleep(7)
    print("Liste de course faite")

def cuisiner_repas(repas):
    time.sleep(6)
    print(f"le {repas} est cuit!")


def time_tracker():
    end_time = time.time()
    elapsed_time = end_time - start_time
    print(f"Work is over. Time taken for the execution: {elapsed_time:.2f} seconds")



#########################################################################################



print("Without using threading:")

sortir_chien("arpeau")
nettoyer_litiere("nuage")
faire_liste_course()
cuisiner_repas("potage aux poireaux")
time_tracker()

task1 = threading.Thread(target=sortir_chien, args=("arpeau",))
task1.start()
task2 = threading.Thread(target=nettoyer_litiere, args=("nuage",))
task2.start()
task3 = threading.Thread(target=faire_liste_course)
task3.start()
task4 = threading.Thread(target=cuisiner_repas, args=("potage de poireaux",))
task4.start()

print("Using threading:")

start_time = time.time()





task1.join()
task2.join()
task3.join()
task4.join()

time_tracker()
