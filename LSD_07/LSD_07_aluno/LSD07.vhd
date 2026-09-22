-- Laboratório de Sistemas Digitais
-- Universidade Federal de Minas Gerais
-- Setembro de 2026
--
-- Arquivo: LSD07.vhd
-- Prática da aula 07

-- Inclusão de bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- declaração da interface da entity
entity LSD07 is
	PORT( clk, tot_ld, tot_clr	: in  STD_LOGIC;
			A 									: in  STD_LOGIC_VECTOR(2 downto 0);
			tot_coins						: out STD_LOGIC_VECTOR(9 downto 0)
	);
end;


architecture bhv of LSD07 is

	signal total_q 	: std_logic_vector(7 downto 0) := x"00";
	signal a_extended : std_logic_vector(7 downto 0) := x"00";
	signal adder_s 	: std_logic_vector(7 downto 0) := x"00";

begin

	-- instância do registrador total
	total: entity work.total 
		port map (
			clk 	=> clk,
			ld 	=> tot_ld,
			clr 	=> tot_clr,
			I		=> adder_s,
			Q		=> total_q
		);
	
	-- instância do somador
	adder: entity work.adder 
		port map (
			A 	=> total_q,
			B 	=> a_extended,
			S	=>	adder_s	
		);
	
	-- 
	a_extended <= "00000" & A;
	tot_coins  <= "00" & total_q;

end;

