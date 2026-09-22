-- ============================================================================
-- Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato
-- Arquivo: tb_flip_flop_d.vhd
-- Descricao: Testbench autochecking do flip-flop D do Guia 6.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity tb_flip_flop_d is
end entity tb_flip_flop_d;

architecture simulation of tb_flip_flop_d is
    signal clk_tb, i_tb, ld_tb, clr_tb, q_tb : std_logic := '0';
    signal finished : boolean := false;
begin
    dut : entity work.flip_flop_d(rtl)
        port map (clk => clk_tb, i => i_tb, ld => ld_tb, clr => clr_tb, q => q_tb);

    -- Processo de clock limitado pelo sinal finished para encerrar a simulacao.
    clock_generator : process
    begin
        while not finished loop
            clk_tb <= '0'; wait for 5 ns;
            clk_tb <= '1'; wait for 5 ns;
        end loop;
        wait;
    end process clock_generator;

    stimulus : process
    begin
        clr_tb <= '1';
        wait for 1 ns;
        assert q_tb = '0' report "Clear assincrono inicial falhou" severity error;
        clr_tb <= '0'; i_tb <= '1'; ld_tb <= '1';
        wait until rising_edge(clk_tb); wait for 1 ns;
        assert q_tb = '1' report "Carga sincrona falhou" severity error;
        ld_tb <= '0'; i_tb <= '0';
        wait until rising_edge(clk_tb); wait for 1 ns;
        assert q_tb = '1' report "FF nao reteve dado com ld=0" severity error;
        clr_tb <= '1'; wait for 1 ns;
        assert q_tb = '0' report "Clear assincrono entre bordas falhou" severity error;
        finished <= true;
        report "tb_flip_flop_d: todos os testes foram aprovados." severity note;
        wait;
    end process stimulus;
end architecture simulation;
