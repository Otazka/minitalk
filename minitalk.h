/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minitalk.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: elenasurovtseva <elenasurovtseva@studen    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/08/01 15:03:08 by elenasurovt       #+#    #+#             */
/*   Updated: 2024/08/01 15:03:25 by elenasurovt      ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINITALK_H
# define MINITALK_H

# include <stdio.h>
# include <unistd.h>
# include <signal.h>

int		ft_atoi(const char *str);
void	char_to_bin(char c, int pid);
void	bin_to_char(int sig, siginfo_t *info, void *context);
void	sig_handler(int sig);
int		ft_printf(const char *format, ...);

#endif