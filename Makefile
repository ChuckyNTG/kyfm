TARGET_EXEC = yafm

SRC_DIRS = ./src
BUILD_DIR = ./build

CC= gcc
CLIBS= -lncurses -lmagic

SRCS = $(shell find $(SRC_DIRS) -name *.cpp -or -name *.c -or -name *.s)
OBJS = $(SRCS:%=$(BUILD_DIR)/%.o)

INC_DIRS = $(shell find $(SRC_DIRS) -type d)
INC_FLAGS = $(addprefix -I,$(INC_DIRS))

CPPFLAGS = $(INC_FLAGS) -O3 -Wall -Werror -pedantic -ggdb3 -std=c99

$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS)
	$(CC) $(OBJS) -o $@ $(LDFLAGS) $(CLIBS)

$(BUILD_DIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

install:
	cp build/yafm ~/bin/
clean:
	$(RM) -r $(BUILD_DIR)
