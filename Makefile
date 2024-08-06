# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: elsurovt <elsurovt@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/06 10:57:10 by elsurovt          #+#    #+#              #
#    Updated: 2024/08/06 10:57:12 by elsurovt         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################
## ARGUMENTS

NAME_CLIENT = client
NAME_SERVER = server
#BONUS_NAME_CLIENT = client_bonus
#BONUS_NAME_SERVER = server_bonus
CFLAGS = -Wall -Wextra -Werror
CC = cc

################################################
## COLORS

# Reset
END_COLOR	= \033[0m       # Text Reset

# Regular Colors
BLACK	= \033[0;30m        # Black
RED		= \033[0;31m          # Red
GREEN	= \033[0;32m        # Green
YELLOW	= \033[0;33m       # Yellow
BLUE	= \033[0;34m         # Blue
PURPLE	= \033[0;35m       # Purple
CYAN	= \033[0;36m         # Cyan
WHITE	= \033[0;37m        # White

################################################
## SOURCES

LIBFT = libft/libft_expanded.a

SRCS_SERVER = server.c
SRCS_CLIENT = client.c
#BONUSC_SRCS_SERVER = client_bonus.c 
#BONUSS_SRCS_CLIENT = server_bonus.c
OBJS_SERVER = $(SRCS_SERVER:.c=.o)
OBJS_CLIENT = $(SRCS_CLIENT:.c=.o)
#BONUSC_OBJS_SERVER = $(BONUSC_SRCS_SERVER:.c=.o)
#BONUSC_OBJS_CLIENT = $(BONUSS_SRCS_CLIENT:.c=.o)

################################################
## RULES

%.o: %.c
		@$(CC) $(CFLAGS) -c $< -o $@

#all : server client client_bonus server_bonus
all : server client

server: libft $(OBJS_SERVER)
		@ $(CC) $(CFLAGS) -o $(NAME_SERVER) $(OBJS_SERVER) $(LIBFT)
		@echo "$(GREEN)$(NAME_SERVER) COMPILED!! $(END_COLOR)"


client: libft $(OBJS_CLIENT)
		@ $(CC) $(CFLAGS) -o $(NAME_CLIENT) $(OBJS_CLIENT) $(LIBFT)
		@echo "$(GREEN)$(NAME_CLIENT) COMPILED!! $(END_COLOR)"

#server_bonus: libft $(BONUSC_OBJS_SERVER)
#		@ $(CC) $(CFLAGS) -o $(BONUS_NAME_SERVER) $(BONUSC_OBJS_SERVER) $(LIBFT)
#		@echo "$(GREEN)$(BONUS_NAME_SERVER) COMPILED!! $(END_COLOR)"

#client_bonus: libft $(BONUSC_OBJS_CLIENT)
#		@ $(CC) $(CFLAGS) -o $(BONUS_NAME_CLIENT) $(BONUSC_OBJS_CLIENT) $(LIBFT)
#		@echo "$(GREEN)$(BONUS_NAME_CLIENT) COMPILED!! $(END_COLOR)"

libft:
		@ make -C libft/

clean:
		@ rm -rf $(OBJS_SERVER) $(OBJS_CLIENT)
		@ rm -rf $(NAME_SERVER) $(NAME_CLIENT)
#		@ rm -rf $(BONUSC_OBJS_SERVER) $(BONUSC_OBJS_CLIENT)
#		@ rm -rf $(BONUS_NAME_SERVER) $(BONUS_NAME_CLIENT)

fclean: clean
		@ rm -rf  $(NAME_SERVER) $(NAME_CLIENT)
#		@ rm -rf  $(BONUS_NAME_SERVER) $(BONUS_NAME_CLIENT)
		@ rm -rf libft_expanded.a
		@ make -C libft/ clean

re: fclean all
.PHONY: all bonus libft clean fclean re