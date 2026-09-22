-- ============================================================================
-- Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato
-- Arquivo: adder.vhd
-- Descricao: Somador generico sem sinal do Guia 5, com indicacao de overflow.
--            S recebe os data_width bits menos significativos de A+B; overflow
--            recebe o carry que excede essa largura de representacao.
-- Sintese:   Logica aritmetica combinacional; nao possui clock nem reset.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
    generic (
        -- O valor padrao atende ao somador de quatro bits solicitado no guia.
        data_width : positive := 4
    );
    port (
        a        : in  std_logic_vector(data_width - 1 downto 0);
        b        : in  std_logic_vector(data_width - 1 downto 0);
        s        : out std_logic_vector(data_width - 1 downto 0);
        overflow : out std_logic
    );
end entity adder;

architecture rtl of adder is
    -- Um bit adicional conserva o carry descartado pela saida S.
    signal sum_extended : unsigned(data_width downto 0);
begin
    -- Os zeros concatenados realizam extensao de largura antes da soma.
    sum_extended <= ('0' & unsigned(a)) + ('0' & unsigned(b));

    -- Parte baixa: resultado modulo 2**data_width visivel na saida principal.
    s <= std_logic_vector(sum_extended(data_width - 1 downto 0));
    -- Parte alta: indica que o resultado matematico nao coube em S.
    overflow <= sum_extended(data_width);
end architecture rtl;
