

filename = "/home/alex/Documents/Cyber/CyberTraining_BeCode_Kamkar3/05-Programming/01-Python/03-FileHandling/file.txt"
with open(filename, "r") as my_file:
    content = my_file.read()
    new = content.split()
    print(new)

filename = "/home/alex/Documents/Cyber/CyberTraining_BeCode_Kamkar3/05-Programming/01-Python/03-FileHandling/file2.txt"    
with open(filename, "w") as my_file:
    my_file.write("\n".join(new))

filename = "/home/alex/Documents/Cyber/CyberTraining_BeCode_Kamkar3/05-Programming/01-Python/03-FileHandling/file2.txt"    
with open(filename, "r") as my_file:
    content = my_file.read()
    print(content)

    


