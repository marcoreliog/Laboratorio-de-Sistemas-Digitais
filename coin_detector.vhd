-- ============================================================================
-- Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato
-- Arquivo: coin_detector.vhd
-- Descricao: Detector combinacional de moedas valido para a pratica do Guia 2.
--            Os codigos de tres bits 001, 010 e 100 representam, nesta ordem,
--            moedas de R$ 0,25, R$ 0,50 e R$ 1,00. A saida c vale '1' somente
--            para esses codigos; ausencia, codigos invalidos e valores nao
--            binarios produzem '0'.
-- Sintese:   Logica combinacional; nao ha clock, reset, memoria ou latches.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity coin_detector is
    port (
        -- Bits do codigo fornecido pelo sensor/leitor de moedas.
        a2 : in  std_logic;
        a1 : in  std_logic;
        a0 : in  std_logic;
        -- Indicacao de que o codigo corresponde a uma moeda aceita.
        c  : out std_logic
    );
end entity coin_detector;

architecture rtl of coin_detector is
    -- Agrupa as tres entradas para uma descricao legivel por tabela-verdade.
    signal coin_code : std_logic_vector(2 downto 0);
begin
    -- Concatenacao puramente combinacional dos bits de entrada.
    coin_code <= a2 & a1 & a0;

    -- A atribuicao por "with/select" cobre explicitamente cada moeda valida.
    -- "others" tambem torna deterministico o comportamento diante de X, Z etc.
    with coin_code select
        c <= '1' when "001",              -- R$ 0,25
             '1' when "010",              -- R$ 0,50
             '1' when "100",              -- R$ 1,00
             '0' when others;              -- Nenhuma moeda ou codigo invalido
end architecture rtl;
