class Creature:

    def __init__(self, height, weight, age):
        self.height = height
        self.weight = weight
        self.age = age

    def speak(self):
        print (f"my age is {self.age}")
    
    # Creating a static method. It is not interacting with the attributes of the class.
    @staticmethod
    def makeNoise(noise):
        print(f"...{noise}...")

    
    def __str__(self):
        return f"{self.height} {self.weight} {self.age}"


class Fish(Creature):

    def __init__(self, height, weight, age, habitat):
        Creature.__init__(self, height, weight, age)
        self.habitat = habitat
    
    def __str__(self):
        return f"{self.height} {self.weight} {self.age} {self.habitat}"

gardon = Fish("3cm", "43gr", "5 months", "lakes and slow streams")

# Using the static method
gardon.makeNoise("bloup")