/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: elenasurovtseva <elenasurovtseva@studen    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/07/31 14:44:49 by elenasurovt       #+#    #+#             */
/*   Updated: 2024/08/06 09:19:40 by elenasurovt      ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	handler(int sig)
{
	static int				i = 0;
	static unsigned char	c = 0;

	if (sig == SIGUSR2)
		c = c << 1;
	else if (sig == SIGUSR1)
		c = (c << 1) | 0b00000001;
	i++;
	if (i == 8)
	{
		ft_printf("%c", c);
		i = 0;
		c = 0;
	}
}

int	main(void)
{
	ft_printf("PID: %d\n", getpid());
	while (1)
	{
		signal(SIGUSR1, handler);
		signal(SIGUSR2, handler);
	}
	return (0);
}
