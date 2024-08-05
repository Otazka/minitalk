# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: elenasurovtseva <elenasurovtseva@studen    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/31 15:41:02 by elenasurovt       #+#    #+#              #
#    Updated: 2024/08/05 23:11:25 by elenasurovt      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS	= client.c server.c

OBJS	:= $(SRCS:%.c=%.o)

NAME	= minitalk

CC		= gcc
RM		= rm -f

CFLAGS 	= -Wall -Wextra -Werror

all:		${NAME}

%.o:	%.c
		${CC} ${CFLAGS} -Ilibft -Iprintf -c $? -o $@

${NAME}:	 server client

server:		server.o
		@make -C libft
		@make -C printf
		${CC} ${CFLAGS} $? -Llibft -lft -Lprintf -lftprintf -o server

client:		client.o
		@make -C libft
		@make -C printf
		${CC} ${CFLAGS} $? -Llibft -lft -Lprintf -lftprintf -o client

libft:
		make -C libft

printf:
		make -C printf

clean:
			make clean -C libft
			make clean -C printf
			${RM} ${OBJS}

fclean:		clean
			${RM} server client

re:			fclean all

.PHONY:		libft printf