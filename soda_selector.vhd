-- ============================================================================
-- Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato
-- Arquivo: soda_selector.vhd
-- Descricao: Codificador de preco para quatro bebidas (Guia 3).
-- Codificacao: S e um numero sem sinal de ponto fixo Q6.2, isto e, os dois
--              bits menos significativos representam quartos de real (R$0,25).
--              R=00 Kuat=2,50; 01 Fanta=2,75; 10 Sprite=3,00; 11 Coca=3,50.
-- Sintese:    Ambas as arquiteturas sao combinacionais e sintetizaveis.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity soda_selector is
    port (
        -- Codigo de selecao da bebida.
        r : in  std_logic_vector(1 downto 0);
        -- Preco codificado no formato Q6.2, em unidades de R$0,25.
        s : out std_logic_vector(7 downto 0)
    );
end entity soda_selector;

-- Primeira solucao solicitada: cada bit de saida e descrito so com portas.
architecture logic_gates of soda_selector is
begin
    -- Bits mais significativos sao sempre zero, pois todos os precos < R$4,00.
    s(7) <= '0';
    s(6) <= '0';
    s(5) <= '0';
    s(4) <= '0';
    -- O bit de 2 reais e comum aos quatro produtos.
    s(3) <= '1';
    -- Bit de 1 real: ativo para Sprite e Coca-Cola (r(1)=1).
    s(2) <= r(1);
    -- Bit de 50 centavos: 1 exceto para Sprite (r="10").
    s(1) <= (not r(1)) or r(0);
    -- Bit de 25 centavos: ativo apenas para Fanta (r="01").
    s(0) <= (not r(1)) and r(0);
end architecture logic_gates;

-- Segunda solucao solicitada: a tabela-verdade aparece diretamente na selecao.
architecture with_select of soda_selector is
begin
    -- "others" define uma saida segura para valores nao binarios da selecao.
    with r select
        s <= "00001010" when "00", -- Guarana Kuat: R$ 2,50 = 10,10b
             "00001011" when "01", -- Fanta Laranja: R$ 2,75 = 10,11b
             "00001100" when "10", -- Sprite Sem Acucar: R$ 3,00 = 11,00b
             "00001110" when "11", -- Coca-Cola Original: R$ 3,50 = 11,10b
             "00000000" when others;
end architecture with_select;
