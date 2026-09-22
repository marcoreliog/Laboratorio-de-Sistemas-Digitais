-- Laboratório de Sistemas Digitais
-- Universidade Federal de Minas Gerais
-- Julho de 2026
--
-- Arquivo: adder.vhd
-- Somador

-- Inclusão de bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

-- declaração da interface da entity
entity adder is
	PORT(
		A, B 	: in 	STD_LOGIC_VECTOR(7 downto 0); 
		S		: out	STD_LOGIC_VECTOR(7 downto 0)
	);
end;


architecture strcl of adder is

begin

	S <= std_logic_vector(unsigned(A) + unsigned(B));

end;