
class Fish:
    creatureType = "Aquatic"
    count = 0

    def __init__ (self, name, location, maxWeight):
        self.name = name
        self.location = location
        self.maxWeight = maxWeight
        Fish.Add_To_Count()
    
    @classmethod
    def Add_To_Count(cls):
        cls.count += 1
    
    @classmethod
    def Get_Count(cls):
        return cls.count

# Create 3 instances
fish1 = Fish("Gardon", "lacs et fleuves", "800gr")
fish2 = Fish("Cabillau", "haute mer", "40kg")
fish3 = Fish("Anguille", "mer, lacs, rivières, marais", "5kg")

print(fish2.Get_Count())

#Question to chatgpt:
# whys is this program returning 3 as print(Fish.Get_Count()) would as well? can the instance access the class variable and methods???