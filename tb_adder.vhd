-- ============================================================================
-- Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato
-- Arquivo: tb_adder.vhd
-- Descricao: Testbench autochecking do somador generico de quatro bits (Guia 5).
--            Cobre soma nula, casos nominais, limite sem overflow e overflow.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_adder is
end entity tb_adder;

architecture simulation of tb_adder is
    signal a_tb, b_tb : std_logic_vector(3 downto 0) := "0000";
    signal s_tb       : std_logic_vector(3 downto 0);
    signal overflow_tb : std_logic;
begin
    -- A largura e explicitada, demonstrando o uso do generic map do componente.
    dut : entity work.adder(rtl)
        generic map (data_width => 4)
        port map (a => a_tb, b => b_tb, s => s_tb, overflow => overflow_tb);

    stimulus : process
        procedure check_sum (
            constant a_value, b_value : in natural range 0 to 15;
            constant expected_sum      : in natural range 0 to 15;
            constant expected_overflow : in std_logic
        ) is
        begin
            a_tb <= std_logic_vector(to_unsigned(a_value, a_tb'length));
            b_tb <= std_logic_vector(to_unsigned(b_value, b_tb'length));
            wait for 10 ns;
            assert s_tb = std_logic_vector(to_unsigned(expected_sum, s_tb'length))
                report "Soma truncada incorreta" severity error;
            assert overflow_tb = expected_overflow
                report "Bit de overflow incorreto" severity error;
        end procedure check_sum;
    begin
        check_sum(0, 0, 0, '0');   -- Elemento neutro.
        check_sum(2, 5, 7, '0');   -- Caso nominal.
        check_sum(7, 8, 15, '0');  -- Maior resultado ainda representavel.
        check_sum(8, 8, 0, '1');   -- 16: volta a zero em quatro bits.
        check_sum(15, 1, 0, '1');  -- Carry isolado.
        check_sum(15, 15, 14, '1'); -- 30 = 11110b; S=1110 e overflow=1.
        report "tb_adder: todos os testes foram aprovados." severity note;
        wait;
    end process stimulus;
end architecture simulation;
