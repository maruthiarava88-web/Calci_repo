#!/bin/bash

# Read values from command-line arguments
num1=$1
num2=$2
choice=$3

# Validate input
if [ $# -ne 3 ]; then
    echo "Usage: $0 <num1> <num2> <choice>"
    echo "Choice: 1=Addition, 2=Subtraction, 3=Multiplication, 4=Division"
    exit 1
fi

# Function for addition
addition() {
    result=$((num1 + num2))
    echo "Addition result: $result"
}

# Function for subtraction
subtraction() {
    result=$((num1 - num2))
    echo "Subtraction result: $result"
}

# Function for multiplication
multiplication() {
    result=$((num1 * num2))
    echo "Multiplication result: $result"
}

# Function for division
division() {
    if [ "$num2" -eq 0 ]; then
        echo "Error: Division by Zero is not allowed"
    else
        result=$(echo "scale=2; $num1 / $num2" | bc)
        echo "Division result: $result"
    fi
}

# Call function based on choice
case $choice in
    1) addition ;;
    2) subtraction ;;
    3) multiplication ;;
    4) division ;;
    *) echo "Invalid Choice" ;;
esac
