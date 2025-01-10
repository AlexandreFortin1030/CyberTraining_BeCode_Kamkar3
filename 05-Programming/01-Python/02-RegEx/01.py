# Create a regex that finds integers without size limit

import re

# Sample string
s = "sssgdds8sfsfs"

# Regex pattern to find integers
pattern = r'\d+'

# Find all integers in the string
integers = re.findall(pattern, s)

# Print the result
print(integers)
