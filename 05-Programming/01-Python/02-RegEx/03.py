# Create a regex that finds (positive or negative) integers without size limit.

import re


s = "sssgdds-8s8fsfs"

pattern = r'-?\d'

number = re.findall(pattern, s)

print(number)
     
