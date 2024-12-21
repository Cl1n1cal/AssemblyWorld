# Makefile for assembling, linking, and running the program

# Variables
ASM = nasm
LD = ld
NASM_FLAGS = -f elf64
LD_FLAGS = 

# Source files
ASM_FILES = main.asm print_welcome.asm print.asm print_options.asm get_int.asm print_invalid_option.asm

# Object files (generated from the assembly files)
OBJ_FILES = $(ASM_FILES:.asm=.o)

# Executable output file
EXEC = main

# Default target
all: $(EXEC)

# Rule to create the executable
$(EXEC): $(OBJ_FILES)
	$(LD) -o $(EXEC) $(OBJ_FILES) $(LD_FLAGS)

# Rule to assemble the .asm files into .o object files
%.o: %.asm
	$(ASM) $(NASM_FLAGS) -o $@ $<

# Clean rule to remove generated files
clean:
	rm -f $(OBJ_FILES) $(EXEC)

# Run the program
run: $(EXEC)
	./$(EXEC)

# Phony targets
.PHONY: all clean run
