#armstrong no:

count_digits() {
    local num=$1
    local count=0
    while [ $num -ne 0 ]; do
        num=$((num / 10))
        count=$((count + 1))
    done
    echo $count
}

power() {
    local base=$1
    local exp=$2
    local result=1
    for ((i=1; i<=exp; i++)); do
        result=$((result * base))
    done
    echo $result
}

is_armstrong() {
    local num=$1
    local temp=$num
    local sum=0
    local n=$(count_digits $num)

    while [ $temp -ne 0 ]; do
        digit=$((temp % 10))
        sum=$((sum + $(power $digit $n)))
        temp=$((temp / 10))
    done

    if [ $sum -eq $num ]; then
        echo "$num is an Armstrong number."
    else
        echo "$num is not an Armstrong number."
    fi
}

read -p "Enter a number: " number
is_armstrong $number

#=====================================================================================
#pattern

#!/bin/bash

read -p "Enter the number of rows: " rows

for ((i=1; i<=rows; i++))
do
    for ((j=i; j<rows; j++))
    do
        echo -n " "
    done
  
    for ((k=1; k<=i; k++))
    do
        echo -n "*"
    done
  
    echo ""
done
read -p "Enter a number: " number

#===========================================================================================================
#odd or even

#!/bin/bash

read -p "Enter a number: " number

if [ $((number % 2)) -eq 0 ]; then
    echo "$number is even."
else
    echo "$number is odd."

fi
#-------------------------------------------------------------------

#!/bin/bash

is_valid_number() {
    [[ "$1" =~ ^-?[0-9]+$ ]]
}

# Loop until a valid number is entered
while true; do
    read -p "Enter a number: " number

    # Check if the input is a valid number
    if is_valid_number "$number"; then
        break
    else
        echo "Invalid input. Please enter a valid integer."
    fi
done

if [ $((number % 2)) -eq 0 ]; then
    echo "$number is even."
else
    echo "$number is odd."
fi


#=============================================================================================
#generate a marksheet
#!/bin/bash

print_line() {
    echo "---------------------------------------------"
}

read -p "Enter student's name: " name
read -p "Enter roll number: " roll_number

read -p "Enter marks for Subject 1: " sub1
read -p "Enter marks for Subject 2: " sub2
read -p "Enter marks for Subject 3: " sub3
read -p "Enter marks for Subject 4: " sub4
read -p "Enter marks for Subject 5: " sub5

total=$((sub1 + sub2 + sub3 + sub4 + sub5))
percentage=$(echo "scale=2; $total / 5" | bc)

if (( $(echo "$percentage >= 35" | bc -l) )); then
    result="Pass"
else
    result="Fail"
fi

print_line
echo "Marksheet for $name (Roll No: $roll_number)"
print_line
echo "Subject 1: $sub1"
echo "Subject 2: $sub2"
echo "Subject 3: $sub3"
echo "Subject 4: $sub4"
echo "Subject 5: $sub5"
print_line
echo "Total Marks: $total"
echo "Percentage: $percentage%"
echo "Result: $result"
print_line


#======================================================================================================
#create a multiple directory

#!/bin/bash

read -p "Enter the number of directories to create: " dir_count

for ((i=1; i<=dir_count; i++))
do
    read -p "Enter name for directory $i: " dir_name

    mkdir -p "$dir_name"

    echo "Directory '$dir_name' created successfully."
done

#==================================================================
#!/bin/bash

# Read the number of directories to create
read -p "Enter the number of directories to create: " dir_count

# Loop through the number of directories
for ((i=1; i<=dir_count; i++))
do
    # Generate directory name (e.g., dir1, dir2, dir3, ...)
    dir_name="dir$i"

    # Create the directory
    mkdir -p "$dir_name"

    # Print success message
    echo "Directory '$dir_name' created successfully."
done

#=====================================================================
#!/bin/bash

# Read search term from the user
read -p "Enter the search term: " search_term

# Read the filename from the user
read -p "Enter the filename to search in: " filename

# Check if the file exists
if [[ ! -f "$filename" ]]; then
    echo "File '$filename' not found!"
    exit 1
fi

# Perform the search using grep
echo "Searching for '$search_term' in '$filename'..."
grep -n "$search_term" "$filename"

# Check if grep found any matches
if [[ $? -ne 0 ]]; then
    echo "No matches found for '$search_term' in '$filename'."
else
    echo "Search complete."
fi


