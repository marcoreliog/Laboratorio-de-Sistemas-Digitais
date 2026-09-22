# Relatório técnico — Guias 2 a 6

Data: 20/09/2026  
Autores: Marco Aurélio Gonçalves e Paulo Resende Orbolato.

## Guia 2 — Coin Detector

`coin_detector.vhd` reconhece `001`, `010` e `100` como R$0,25, R$0,50 e R$1,00. A lógica é combinacional e a saída é zero para qualquer outro código, inclusive estados não binários. `tb_coin_detector.vhd` verifica os oito códigos binários e entradas `X`/`Z`.

No Quartus, o RTL Viewer deve apresentar lógica combinacional equivalente a três produtos somados (ou a sua forma minimizada). O Technology Map Viewer apresenta a realização após mapeamento para os recursos físicos da FPGA, portanto pode mostrar LUTs e inversores em uma estrutura diferente, porém funcionalmente equivalente.

## Guia 3 — Soda Selector

O preço usa ponto fixo sem sinal Q6.2: dois bits fracionários representam incrementos de R$0,25. Assim, 2,50, 2,75, 3,00 e 3,50 são `00001010`, `00001011`, `00001100` e `00001110`. Não se trata de uma codificação inteira em reais; é um inteiro escalonado por quatro.

`soda_selector.vhd` mantém as arquiteturas `logic_gates` e `with_select`. A testbench demonstra que ambas são equivalentes para as quatro entradas binárias. Para expandir para oito bebidas, a entrada `r` deve passar para três bits e a tabela/expressões da arquitetura devem incluir os oito preços.

## Guia 4 — Comparator

`comparator.vhd` é genérico (`data_width`, padrão 8) e contém duas arquiteturas. `twos_complement` usa `signed(a)` e `signed(b)`; `unsigned_magnitude` usa `unsigned(a)` e `unsigned(b)`. Por isso, para quatro bits, `1000` é menor que `0111` na primeira versão (-8 < 7), mas maior na segunda (8 > 7). O testbench fornecido instancia quatro bits para manter as ondas mais fáceis de inspecionar. `comparator_4.vhd` é o wrapper que aplica `generic map (data_width => 4)` sem alterar o componente reutilizado.

## Guia 5 — Adder

`adder.vhd` soma dois valores `unsigned` genéricos. A soma é calculada com um bit extra: `s` recebe os bits baixos e `overflow` recebe o bit alto. Em quatro bits, 15 + 1 resulta em `s=0000` e `overflow=1`; a saída principal contém, portanto, a soma módulo 16.

## Guia 6 — Total

`flip_flop_d.vhd` e `total.vhd` usam processos comportamentais. Em ambos, `clr` é assíncrono e tem prioridade; `ld` só é avaliado na borda de subida. `total_tb.vhd` exercita clear inicial, carga de `A5`, retenção com `ld=0`, carga de `3C`, clear entre bordas e prioridade do clear.

Modelos usados: Coin Detector e Soda Selector são fluxo de dados concorrente; Comparator e Adder também são fluxo de dados (operações/atribuições concorrentes); `comparator_4` é estrutural por instanciar o componente genérico; Flip-flop D e Total são comportamentais por serem descritos em processos sequenciais.

## Validação realizada

As fontes foram analisadas e simuladas em GHDL 1.0.0, VHDL-2008. Todos os testbenches abaixo concluíram sem erros de `assert`:

- `tb_coin_detector` — 100 ns
- `tb_soda_selector` — 60 ns
- `tb_comparator` — 60 ns
- `tb_comparator_4` — 30 ns
- `tb_adder` — 60 ns
- `tb_flip_flop_d` — 17 ns
- `total_tb` — 46 ns

As atribuições de pinos e a geração de `.sof` dependem do projeto Quartus e da placa DE10-Lite física; por isso não foram incluídas no workspace.
