-- ============================================================================
-- Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato
-- Arquivo: total.vhd
-- Descricao: Registrador generico Total do Guia 6. Armazena o vetor i de W
--            bits na borda de subida quando ld='1'; clr limpa q assincronamente.
-- Sintese:   Banco de W flip-flops D com clear assincrono e clock enable.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity total is
    generic (
        -- Largura do registrador; a pratica instancia W=8 no testbench.
        W : positive := 8
    );
    port (
        clk : in  std_logic;
        i   : in  std_logic_vector(W - 1 downto 0);
        ld  : in  std_logic;
        clr : in  std_logic;
        q   : out std_logic_vector(W - 1 downto 0)
    );
end entity total;

architecture rtl of total is
begin
    -- Processo sequencial: clr e assincrono; ld e avaliado apenas no clock.
    process (clk, clr)
    begin
        if clr = '1' then
            q <= (others => '0'); -- Limpa simultaneamente todos os W bits.
        elsif rising_edge(clk) then
            if ld = '1' then
                q <= i;           -- Carregamento sincrono do barramento inteiro.
            end if;                -- Retencao implicita do registrador quando ld='0'.
        end if;
    end process;
end architecture rtl;
