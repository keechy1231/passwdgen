#!/bin/bash

#variables
passwd=$1
year=$2
additionalyears=$3



# Check to see if all arguments are met
if [ $# -eq 0 ]; then
    echo "Error: No arguments or to few arguments provided"
    echo "Usage: ./passwdgen.sh [Password] [Start Year] [Additional Years]"
    echo ""
    echo "Usage Example: ./passwdgen.sh Spring 2022 5"
    exit 1
fi

#Get length for the crunch command
length=$(echo $passwd$year | wc | awk '{print $NF}')
length=$((length))

touch passwdlist.txt


#Run the crunch command for the word and year given and add the additional years. 
for i in $(seq $year $(($year+$additionalyears))); do
    if [ $i -eq $year ]; then
        echo "[+] Creating wordlist with $passwd$i"
    else
        echo "[+] Adding to wordlist with $passwd$i"
    fi

    crunch $length $length -t $passwd$i^ >> passwdlist.txt >/dev/null 2>&1

done
