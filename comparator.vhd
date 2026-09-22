-- ============================================================================
-- Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato
-- Arquivo: comparator.vhd
-- Descricao: Comparador generico de magnitude e igualdade para o Guia 4.
--            A arquitetura twos_complement interpreta A e B como signed;
--            unsigned_magnitude interpreta os mesmos vetores como unsigned.
-- Sintese:   Logica combinacional generica, sem clock, reset ou latches.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator is
    generic (
        -- Largura das duas palavras comparadas; o guia usa 8 e 4 bits.
        data_width : positive := 8
    );
    port (
        a  : in  std_logic_vector(data_width - 1 downto 0);
        b  : in  std_logic_vector(data_width - 1 downto 0);
        gt : out std_logic; -- '1' quando A e estritamente maior que B.
        eq : out std_logic; -- '1' quando A e exatamente igual a B.
        lt : out std_logic  -- '1' quando A e estritamente menor que B.
    );
end entity comparator;

-- Implementacao para numeros em complemento de dois (signed do numeric_std).
architecture twos_complement of comparator is
begin
    gt <= '1' when signed(a) > signed(b) else '0';
    eq <= '1' when signed(a) = signed(b) else '0';
    lt <= '1' when signed(a) < signed(b) else '0';
end architecture twos_complement;

-- Implementacao alternativa para magnitudes sem sinal (unsigned do numeric_std).
architecture unsigned_magnitude of comparator is
begin
    gt <= '1' when unsigned(a) > unsigned(b) else '0';
    eq <= '1' when unsigned(a) = unsigned(b) else '0';
    lt <= '1' when unsigned(a) < unsigned(b) else '0';
end architecture unsigned_magnitude;
