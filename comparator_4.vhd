-- ============================================================================
-- Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato
-- Arquivo: comparator_4.vhd
-- Descricao: Top-level de quatro bits do Guia 4. Reutiliza comparator.vhd sem
--            modifica-lo, especializando data_width por meio de generic map.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity comparator_4 is
    port (
        a  : in  std_logic_vector(3 downto 0);
        b  : in  std_logic_vector(3 downto 0);
        gt : out std_logic;
        eq : out std_logic;
        lt : out std_logic
    );
end entity comparator_4;

architecture rtl of comparator_4 is
begin
    -- Para a placa, o wrapper adota a versao em complemento de dois do roteiro.
    comparator_instance : entity work.comparator(twos_complement)
        generic map (data_width => 4)
        port map (a => a, b => b, gt => gt, eq => eq, lt => lt);
end architecture rtl;
