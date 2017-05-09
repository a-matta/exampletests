import random
import string

def random_string(name):
    # THIS CAN DO ANY MAGIC
    return name.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(4))
