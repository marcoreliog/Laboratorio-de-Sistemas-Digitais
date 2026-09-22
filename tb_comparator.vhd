-- ============================================================================
-- Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato
-- Arquivo: tb_comparator.vhd
-- Descricao: Testbench autochecking das versoes signed e unsigned do Guia 4.
--            Inclui igualdade, limites e pares que diferenciam as semanticas.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity tb_comparator is
end entity tb_comparator;

architecture simulation of tb_comparator is
    signal a_tb, b_tb : std_logic_vector(3 downto 0) := "0000";
    signal signed_gt, signed_eq, signed_lt : std_logic;
    signal unsigned_gt, unsigned_eq, unsigned_lt : std_logic;
begin
    dut_signed : entity work.comparator(twos_complement)
        generic map (data_width => 4)
        port map (a => a_tb, b => b_tb, gt => signed_gt, eq => signed_eq, lt => signed_lt);
    dut_unsigned : entity work.comparator(unsigned_magnitude)
        generic map (data_width => 4)
        port map (a => a_tb, b => b_tb, gt => unsigned_gt, eq => unsigned_eq, lt => unsigned_lt);

    stimulus : process
        procedure check_pair (
            constant a_value, b_value : in std_logic_vector(3 downto 0);
            constant s_gt, s_eq, s_lt  : in std_logic;
            constant u_gt, u_eq, u_lt  : in std_logic;
            constant label_text        : in string
        ) is
        begin
            a_tb <= a_value;
            b_tb <= b_value;
            wait for 10 ns;
            assert signed_gt = s_gt and signed_eq = s_eq and signed_lt = s_lt
                report "Resultado signed incorreto: " & label_text severity error;
            assert unsigned_gt = u_gt and unsigned_eq = u_eq and unsigned_lt = u_lt
                report "Resultado unsigned incorreto: " & label_text severity error;
            assert (signed_gt xor signed_eq xor signed_lt) = '1'
                report "Saidas signed nao sao mutuamente exclusivas" severity error;
            assert (unsigned_gt xor unsigned_eq xor unsigned_lt) = '1'
                report "Saidas unsigned nao sao mutuamente exclusivas" severity error;
        end procedure check_pair;
    begin
        check_pair("0000", "0000", '0', '1', '0', '0', '1', '0', "zero igual a zero");
        check_pair("0000", "0111", '0', '0', '1', '0', '0', '1', "zero e sete");
        -- 1000 representa -8 em complemento de dois e 8 sem sinal.
        check_pair("1000", "0111", '0', '0', '1', '1', '0', '0', "-8/8 contra 7");
        check_pair("0111", "1000", '1', '0', '0', '0', '0', '1', "7 contra -8/8");
        check_pair("1111", "0000", '0', '0', '1', '1', '0', '0', "-1/15 contra zero");
        check_pair("1111", "1111", '0', '1', '0', '0', '1', '0', "limite superior igual");
        report "tb_comparator: todos os testes foram aprovados." severity note;
        wait;
    end process stimulus;
end architecture simulation;
