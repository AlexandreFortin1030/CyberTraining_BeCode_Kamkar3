###---inheritance---###############################################################################################

# To built a new class, we can borrow the attributes of an existing class and built the new one from it.
# Here we use the Creature class to get the basic features of the Fish class.

class Creature:

    def __init__(self, height, weight, age):
        self.height = height
        self.weight = weight
        self.age = age

    def speak(self):
        print (f"my age is {self.age}")
    
    def __str__(self):
        return f"{self.height} {self.weight} {self.age}"

# Here we pass the Creature class
class Fish(Creature):
    # And here we use it to built the attribute of our Fish class before adding a new one.
    def __init__(self, height, weight, age, habitat):
        Creature.__init__(self, height, weight, age)
        self.habitat = habitat
    
    def __str__(self):
        return f"{self.height} {self.weight} {self.age} {self.habitat}"

gardon = Fish("3cm", "43gr", "5 months", "lakes and slow streams")
print(gardon)
gardon.speak()

# It seems the best way to trigger inheritance is to use the super() function.
# Like so:

#class Fish(Creature):
    
    #def __init__(self, height, weight, age, habitat):
        # We add the super() and the instead of the parent classe's name.
       # super().__init__(self, height, weight, age)
       # self.habitat = habitat
    
   # def __str__(self):
        #return f"{self.height} {self.weight} {self.age} {self.habitat}"

#gardon = Fish("3cm", "43gr", "5 months", "lakes and slow streams")
#print(gardon)
#gardon.speak()



