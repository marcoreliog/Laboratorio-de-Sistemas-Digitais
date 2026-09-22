-- ============================================================================
-- Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato
-- Data: 20/09/2026
-- Arquivo: flip_flop_d.vhd
-- Descricao: Flip-flop D do Guia 6. ld e habilitacao sincrona ativa em '1';
--            clr e limpeza assincrona ativa em '1'.
-- Sintese:   Um flip-flop D com clear assincrono e clock enable.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity flip_flop_d is
    port (
        clk : in  std_logic; -- Clock: dados sao avaliados na borda de subida.
        i   : in  std_logic; -- Dado a ser eventualmente armazenado.
        ld  : in  std_logic; -- Load sincrono; habilita a captura quando em '1'.
        clr : in  std_logic; -- Clear assincrono; zera q imediatamente quando em '1'.
        q   : out std_logic  -- Dado armazenado.
    );
end entity flip_flop_d;

architecture rtl of flip_flop_d is
begin
    -- clr aparece na lista de sensibilidade por ser assincrono.
    process (clk, clr)
    begin
        if clr = '1' then
            q <= '0';                 -- Reset independe de clock e de ld.
        elsif rising_edge(clk) then
            if ld = '1' then
                q <= i;               -- Captura apenas na borda ascendente.
            end if;                    -- Sem else: q conserva o estado quando ld='0'.
        end if;
    end process;
end architecture rtl;
