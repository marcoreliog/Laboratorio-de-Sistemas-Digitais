-- ============================================================================
-- Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato
-- Arquivo: tb_comparator_4.vhd
-- Descricao: Testbench do top-level comparator_4 do Guia 4. Confirma que o
--            wrapper aplica data_width=4 e a semantica de complemento de dois.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity tb_comparator_4 is
end entity tb_comparator_4;

architecture simulation of tb_comparator_4 is
    signal a_tb, b_tb : std_logic_vector(3 downto 0) := "0000";
    signal gt_tb, eq_tb, lt_tb : std_logic;
begin
    -- O DUT e o wrapper estrutural, e nao o comparator generico diretamente.
    dut : entity work.comparator_4(rtl)
        port map (a => a_tb, b => b_tb, gt => gt_tb, eq => eq_tb, lt => lt_tb);

    stimulus : process
    begin
        a_tb <= "0011"; b_tb <= "0011"; wait for 10 ns;
        assert eq_tb = '1' and gt_tb = '0' and lt_tb = '0'
            report "Wrapper falhou no caso de igualdade" severity error;
        -- 1000 = -8 e portanto e menor que 0111 = +7 no modo signed adotado.
        a_tb <= "1000"; b_tb <= "0111"; wait for 10 ns;
        assert lt_tb = '1' and gt_tb = '0' and eq_tb = '0'
            report "Wrapper nao usou complemento de dois" severity error;
        a_tb <= "0111"; b_tb <= "1000"; wait for 10 ns;
        assert gt_tb = '1' and lt_tb = '0' and eq_tb = '0'
            report "Wrapper falhou na ordem signed inversa" severity error;
        report "tb_comparator_4: todos os testes foram aprovados." severity note;
        wait;
    end process stimulus;
end architecture simulation;
