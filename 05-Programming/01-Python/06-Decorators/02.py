### Decorators are functions that can be added on to of other function to amend their behavior without changing their inside mechanics.
# It can be veru usefull since a single decorator can be added to a huge number of other functions if needed. 
# It is then much better to write than if conditions and much better to maintain or modify.
import time

start_time = 0

def time_tracker(func):
    def wrapper(*args, **kwargs):
        start_time = time.time()
        result = func(*args, **kwargs)
        end_time = time.time()
        elapsed_time = end_time - start_time
        print(f"time elapsed {elapsed_time} seconds")
        return result
    return wrapper



def say_hello(func):
    def wrapper():
        print("** Hey, hello! **")
        func()
    return wrapper


@time_tracker
@say_hello
def ask_state():
    name = input("What's your name?")
    print(f"Have a good day {name}")


ask_state()