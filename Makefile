# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: elenasurovtseva <elenasurovtseva@studen    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/31 15:41:02 by elenasurovt       #+#    #+#              #
#    Updated: 2024/08/01 15:01:41 by elenasurovt      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SERVER = server

CLIENT = client

SRCS1 = server.c

SRCS2 = client.c

OBJS1 = ${SRCS1:.c=.o}

OBJS2 = ${SRCS2:.c=.o}

HEADERS = minitalk.h

CFLAGS = -Werror -Wall -Wextra -g

.c.o:
			@cc ${CFLAGS} -c $^ -o $@

all:		${SERVER} ${CLIENT}

$(SERVER):	${OBJS1}
					@cc ${OBJS1} $(CFLAGS) -o $(SERVER)
					@echo "Server compiled!"

$(CLIENT):	${OBJS2}
					@cc ${OBJS2} $(CFLAGS) -o $(CLIENT)
					@echo "Client compiled!"

clean:
			@rm -f ${OBJS1}
			@rm -f ${OBJS2}

fclean:		clean
			@rm -f ${SERVER}
			@rm -f ${CLIENT}
			@echo "All clean!"

re: fclean all

.PHONY: all clean fclean re
