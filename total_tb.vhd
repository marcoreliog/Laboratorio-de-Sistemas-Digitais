-- ============================================================================
-- Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato
-- Arquivo: total_tb.vhd
-- Descricao: Testbench autochecking do registrador Total do Guia 6 para W=8.
--            Exercita exatamente os cenarios solicitados pelo roteiro.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity total_tb is
end entity total_tb;

architecture simulation of total_tb is
    signal my_clock : std_logic := '0';
    signal i_tb, q_tb : std_logic_vector(7 downto 0) := (others => '0');
    signal ld_tb, clr_tb : std_logic := '0';
    signal finished : boolean := false;
begin
    -- Instanciacao com generic map, conforme solicitado para W=8.
    dut : entity work.total(rtl)
        generic map (W => 8)
        port map (clk => my_clock, i => i_tb, ld => ld_tb, clr => clr_tb, q => q_tb);

    -- Clock de periodo de 10 ns, interrompido ao termino dos estimulos.
    clock_generator : process
    begin
        while not finished loop
            my_clock <= '0'; wait for 5 ns;
            my_clock <= '1'; wait for 5 ns;
        end loop;
        wait;
    end process clock_generator;

    stimulus : process
    begin
        -- 1. Limpeza assincrona inicial, antes de qualquer borda de subida.
        clr_tb <= '1'; ld_tb <= '0'; i_tb <= x"00";
        wait for 1 ns;
        assert q_tb = x"00" report "Limpeza assincrona inicial falhou" severity error;

        -- 2. A5 deve ser carregado na proxima borda de subida.
        clr_tb <= '0'; ld_tb <= '1'; i_tb <= x"A5";
        wait until rising_edge(my_clock); wait for 1 ns;
        assert q_tb = x"A5" report "A5 nao foi carregado na borda de subida" severity error;

        -- 3. Com ld=0, mudar i para 3C nao pode alterar o valor armazenado.
        ld_tb <= '0'; i_tb <= x"3C";
        wait until rising_edge(my_clock); wait for 1 ns;
        assert q_tb = x"A5" report "Registrador nao reteve A5 com ld=0" severity error;

        -- 4. Reabilitar ld carrega o 3C que permaneceu na entrada.
        ld_tb <= '1';
        wait until rising_edge(my_clock); wait for 1 ns;
        assert q_tb = x"3C" report "3C nao foi carregado apos habilitar ld" severity error;

        -- 5. Clear entre bordas deve atuar imediatamente, sem esperar clock.
        wait until falling_edge(my_clock); wait for 2 ns;
        clr_tb <= '1'; wait for 1 ns;
        assert q_tb = x"00" report "Limpeza assincrona entre bordas falhou" severity error;

        -- 6. Enquanto clr=1 nem uma borda de clock pode carregar novo valor.
        i_tb <= x"F0"; ld_tb <= '1';
        wait until rising_edge(my_clock); wait for 1 ns;
        assert q_tb = x"00" report "Clear nao teve prioridade sobre o clock" severity error;
        clr_tb <= '0';
        wait until rising_edge(my_clock); wait for 1 ns;
        assert q_tb = x"F0" report "F0 nao foi carregado apos liberar clear" severity error;

        finished <= true;
        report "total_tb: todos os testes foram aprovados." severity note;
        wait;
    end process stimulus;
end architecture simulation;
