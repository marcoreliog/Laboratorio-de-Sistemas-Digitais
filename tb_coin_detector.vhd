-- ============================================================================
-- Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato
-- Data: 20/09/2026
-- Arquivo: tb_coin_detector.vhd
-- Descricao: Testbench autochecking do detector de moedas do Guia 2.
--            Percorre os oito codigos binarios e tambem verifica entradas X/Z.
-- Uso:       ghdl -a --std=08 coin_detector.vhd tb_coin_detector.vhd
--            ghdl -e --std=08 tb_coin_detector && ghdl -r tb_coin_detector
-- Sintese:   Este arquivo e exclusivo de simulacao; os comandos assert e wait
--            nao devem ser incluidos no projeto sintetizavel.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity tb_coin_detector is
end entity tb_coin_detector;

architecture simulation of tb_coin_detector is
    -- Entradas aplicadas ao DUT (Device Under Test).
    signal a2_tb : std_logic := '0';
    signal a1_tb : std_logic := '0';
    signal a0_tb : std_logic := '0';
    -- Saida observada do DUT.
    signal c_tb  : std_logic;
begin
    -- Instanciacao direta da entidade evita declaracao redundante de component.
    dut : entity work.coin_detector(rtl)
        port map (
            a2 => a2_tb,
            a1 => a1_tb,
            a0 => a0_tb,
            c  => c_tb
        );

    -- Processo sequencial apenas para gerar estimulos e conferir resultados.
    stimulus : process
        -- Procedimento local: aplica um codigo, espera a propagacao e valida c.
        procedure check_code (
            constant code     : in std_logic_vector(2 downto 0);
            constant expected : in std_logic;
            constant label_text : in string
        ) is
        begin
            a2_tb <= code(2);
            a1_tb <= code(1);
            a0_tb <= code(0);
            wait for 10 ns;
            assert c_tb = expected
                report "Falha para " & label_text
                severity error;
        end procedure check_code;
    begin
        -- Todos os codigos binarios: limites e valores nominais da tabela.
        check_code("000", '0', "000 (sem moeda)");
        check_code("001", '1', "001 (R$ 0,25)");
        check_code("010", '1', "010 (R$ 0,50)");
        check_code("011", '0', "011 (invalido)");
        check_code("100", '1', "100 (R$ 1,00)");
        check_code("101", '0', "101 (invalido)");
        check_code("110", '0', "110 (invalido)");
        check_code("111", '0', "111 (invalido)");

        -- Condicoes de erro do leitor: a saida deve permanecer segura em zero.
        check_code("X01", '0', "X01 (entrada desconhecida)");
        check_code("0Z1", '0', "0Z1 (entrada em alta impedancia)");

        report "tb_coin_detector: todos os testes foram aprovados." severity note;
        wait; -- Encerra a geracao de novos eventos na simulacao.
    end process stimulus;
end architecture simulation;
