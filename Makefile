##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## by Nathan GUIGUI
##

CC	= ld

ASM = nasm

ASMFLAGS = -f elf64

RM	= rm -f

NAME	= libasm.so

SRCS	=	src/strlen.S \
			src/strchr.S \
			src/memset.S \
			src/memcpy.S \
			src/strcmp.S \
			src/memmove.S \
			src/strncmp.S \
			src/strcasecmp.S \
			src/rindex.S \
			src/strcspn.S

CFLAGS	= -shared -fpic

OBJS	= $(SRCS:.S=.o)

%.o:%.S 
	@$(ASM) -o $@ $< $(ASMFLAGS)

all: $(NAME)

$(NAME): $(OBJS)
	@$(CC) $(CFLAGS) -o $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS) *~ *# vgcore.*

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
