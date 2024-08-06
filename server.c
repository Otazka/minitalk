/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: elsurovt <elsurovt@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/08/06 10:54:47 by elsurovt          #+#    #+#             */
/*   Updated: 2024/08/06 10:54:51 by elsurovt         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <ucontext.h>
#include <signal.h>
#include "libft/libft.h"

void	binary_controller(int sig)
{
	static int	octet;
	static int	i;

	if (sig == SIGUSR1)
		i |= (0x01 << octet);
	octet++;
	if (octet == 8)
	{
		ft_printf("%c", i);
		octet = 0;
		i = 0;
	}
}

int	main(int argc, char **argv)
{
	(void)argv;
	if (argc != 1)
	{
		ft_printf("Error\n");
		return (1);
	}
	ft_printf("SERVER %i || ONLINE \n\n", getpid());
	while (argc == 1)
	{
		signal(SIGUSR1, binary_controller);
		signal(SIGUSR2, binary_controller);
		pause ();
	}
	return (0);
}
