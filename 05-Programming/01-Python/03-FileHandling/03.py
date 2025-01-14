import os

#path = os.path.abspath("")
#print(path)

#directoryNames = os.path.dirname(path)
#print(directoryNames)



folder_path = os.path.abspath("./")
print(folder_path)

for path, dirs, files in os.walk(folder_path):
    for filename in files:
        print(filename)