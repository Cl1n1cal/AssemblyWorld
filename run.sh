#!/bin/bash

# Check if the program name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <source_file.asm>"
    exit 1
fi

# Extract the file name without extension
source_file=$1
program_name=$(basename "$source_file" .asm)

# Step 1: Assemble the program
echo "Assembling $source_file..."
nasm -f elf64 -o "$program_name.o" "$source_file"

# Step 2: Link the object file to create an executable
echo "Linking $program_name.o..."
ld -o "$program_name" "$program_name.o" "strlen.o" "print_welcome.o"

# Step 3: Run the program
echo "Running $program_name..."
./"$program_name"

# Optionally, clean up the object file after running the program
# Uncomment the following line to remove the object file
# rm "$program_name.o"

