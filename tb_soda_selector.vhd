-- ============================================================================
-- Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato
-- Arquivo: tb_soda_selector.vhd
-- Descricao: Testbench autochecking das arquiteturas logic_gates e with_select
--            do Guia 3. Garante equivalencia funcional para todos os seletores.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity tb_soda_selector is
end entity tb_soda_selector;

architecture simulation of tb_soda_selector is
    signal r_tb        : std_logic_vector(1 downto 0) := "00";
    signal s_logic_tb  : std_logic_vector(7 downto 0);
    signal s_select_tb : std_logic_vector(7 downto 0);
begin
    -- As duas instancias recebem exatamente o mesmo seletor.
    dut_logic : entity work.soda_selector(logic_gates)
        port map (r => r_tb, s => s_logic_tb);
    dut_select : entity work.soda_selector(with_select)
        port map (r => r_tb, s => s_select_tb);

    stimulus : process
        procedure check_selection (
            constant selection : in std_logic_vector(1 downto 0);
            constant expected  : in std_logic_vector(7 downto 0);
            constant label_text : in string
        ) is
        begin
            r_tb <= selection;
            wait for 10 ns;
            assert s_logic_tb = expected
                report "logic_gates: preco incorreto para " & label_text severity error;
            assert s_select_tb = expected
                report "with_select: preco incorreto para " & label_text severity error;
            assert s_logic_tb = s_select_tb
                report "Arquiteturas nao equivalentes para " & label_text severity error;
        end procedure check_selection;
    begin
        check_selection("00", "00001010", "Kuat");
        check_selection("01", "00001011", "Fanta");
        check_selection("10", "00001100", "Sprite");
        check_selection("11", "00001110", "Coca-Cola");
        -- Valores nao binarios devem resultar em zero na versao with_select.
        r_tb <= "X0"; wait for 10 ns;
        assert s_select_tb = "00000000"
            report "with_select nao tratou entrada desconhecida" severity error;
        r_tb <= "Z1"; wait for 10 ns;
        assert s_select_tb = "00000000"
            report "with_select nao tratou entrada em alta impedancia" severity error;
        report "tb_soda_selector: todos os testes foram aprovados." severity note;
        wait;
    end process stimulus;
end architecture simulation;
