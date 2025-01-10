# Create a regex that finds negative integers without size limit

import re

# Sample string
s = "sssgdds-8sfsfs"

# Regex pattern to find integers
pattern = r'-\d+'

# Find all integers in the string
Nintegers = re.findall(pattern, s)

# Print the result
print(Nintegers)
