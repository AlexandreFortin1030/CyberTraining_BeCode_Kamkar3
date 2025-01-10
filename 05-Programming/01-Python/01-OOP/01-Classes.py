
###---Introduction---###############################################################################################

# Defining an object (class) to pratice python
class Blackboard:

    def __init__ (self):
        self.surface = ""

    def write(self, message_written):
        if self.surface != "":
            self.surface += "\n"
        self.surface += message_written

    def read(self):
        if self.surface != "":
            print(self.surface)
        else:
            print("There is nothing to see, sorry!")

    def reset(self):
        self.surface = ""

# Building an instance of the defined class and testing it

board = Blackboard()

board.write("hello!")
board.read()
board.write("Goodbye!")
board.read()
board.reset()
board.read()

# Printing all attributes and methods of the object
infos = dir(Blackboard)
print(infos)




###---Encapsulation---###############################################################################################


# In this section of the program, we could alter the board.surface variable like so:
# board.surface = "x". 
# To prevent variables and methods to be used outside the scope of an object,
# we use one "_" underscore as a sort of flag for humans (restricted) and two "__" before 
# the name of the method (private) to enfore it beeing not accessible ---> self.__surface 
...

board = Blackboard()

board.write("hello!")
board.read()
board.write("Goodbye!")
board.read()
board.reset()
board.read()

...

