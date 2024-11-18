#!/bin/bash
# Safe deletion script:

# shred <option> <filename>

# <-u> : Removes file after shredding it.
# <-v> : Enables verbose mode
# <-n> : Specifies the number of passes of random bits (default is 3).
# <-z> : Final pass of zeros to cover tracks.
 
####################################################################
clear
Banner=$(cat << 'EOF'
Welcome to the...



          ▗▞▀▜▌▄▄▄▄  ▄▄▄▄  ▄ ▐▌   ▄ █ ▗▞▀▜▌   ■   ▄▄▄   ▄▄▄ 
          ▝▚▄▟▌█   █ █   █ ▄ ▐▌   ▄ █ ▝▚▄▟▌▗▄▟▙▄▖█   █ █    
               █   █ █   █ █ ▐▛▀▚▖█ █        ▐▌  ▀▄▄▄▀ █    
                           █ ▐▌ ▐▌█ █        ▐▌             .
                                             ▐▌
                                                        .-~~~-.
                                                      /        }
                                                     /      .-~
                                                    |        }
                                        ___\.~~-.-~|     .-~_
                                            { O  |  ` .-~.   ; ~-.__
                                             ~--~/-|_\|  :   : .-~
                                                /  |  \~ - - ~
                                               /   |   \                                   
                                         
EOF
)
           
echo -e "$Banner"

# Ask for the file to delete
read -p "-----> 👀 Enter the path to the file you want to annihilate: " file_path

# [Error handling] Check if the file exists
if [ ! -f "$file_path" ]; then
    echo "Error: File does not exist."
    exit 1
fi

# Ask for the number of random passes
read -p "🔪Enter the number of random passes (7 is a safety standard): " passes

# [Error handling] Validate the input for passes (it should be a positive integer)
if ! [[ "$passes" =~ ^[0-9]+$ ]] || [ "$passes" -lt 1 ]; then
    echo "Error: Please enter a valid positive integer for the number of passes."
    exit 1
fi

# Confirm the operation
echo "You are about to securely delete the file: $file_path"
echo "The file will be overwritten $passes times (random data), and the deletion will be irreversible."
read -p "Are you sure you want to continue? 🦇 🦇 🦇 (y/n): " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
    # Perform the shredding operation with user input
    shred -u -v -n "$passes" -z "$file_path"
    echo "
    
    
      $file_path ...?
   
   "
    echo " 
                         ...Sorry, never heard of. 💀💀💀"
echo "

"
else
    echo "Operation cancelled."
fi

