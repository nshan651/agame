CC = gcc
CFLAGS = -g -Wall -Wextra -std=c11
LDFLAGS = -lraylib
SRC_DIR = src
BIN_DIR = bin

# List all C source files
SRCS = $(wildcard $(SRC_DIR)/*.c)

# Generate corresponding object file names
OBJS = $(patsubst $(SRC_DIR)/%.c, $(BIN_DIR)/%.o, $(SRCS))

# Executable name
TARGET = $(BIN_DIR)/agame

# Default target
all: $(TARGET)

# Run
run:
	./bin/agame

# Rule to compile C source files to object files
$(BIN_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to link object files and generate the executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

# Rule to clean the project
clean:
	rm -rf $(BIN_DIR)/*.o $(TARGET)
