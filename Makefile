##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## by Ugo MOULIN
##

CC	= gcc

ASM = nasm

ASMFLAGS = -f elf64

RM	= rm -f

NAME	= libasm.so

SRCS	=	src/strlen.S \
			src/strchr.S \
			src/memset.S

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
