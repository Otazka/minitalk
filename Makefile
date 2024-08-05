# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: elenasurovtseva <elenasurovtseva@studen    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/31 15:41:02 by elenasurovt       #+#    #+#              #
#    Updated: 2024/08/06 00:34:57 by elenasurovt      ###   ########.fr        #
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
		${CC} ${CFLAGS} -Ilibft -c $? -o $@

${NAME}:	 server client

server:		server.o
		@make -C libft
		${CC} ${CFLAGS} $? -Llibft -lft -o server

client:		client.o
		@make -C libft
		${CC} ${CFLAGS} $? -Llibft -lft -o client

libft:
		make -C libft


clean:
			make clean -C libft
			${RM} ${OBJS}

fclean:		clean
			${RM} server client

re:			fclean all

.PHONY:		libft