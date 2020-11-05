onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_br/reloj
add wave -noupdate /prueba_br/PE
add wave -noupdate -radix unsigned /prueba_br/IDE
add wave -noupdate -radix unsigned /prueba_br/banco_reg/idedeco 
add wave -noupdate -radix hexadecimal /prueba_br/DE
add wave -noupdate -radix unsigned /prueba_br/IDL1
add wave -noupdate -radix hexadecimal /prueba_br/LE1
add wave -noupdate -radix unsigned /prueba_br/IDL2
add wave -noupdate -radix hexadecimal /prueba_br/LE2
add wave -noupdate -radix hexadecimal -childformat {{/prueba_br/banco_reg/mem(0) -radix hexadecimal} {/prueba_br/banco_reg/mem(1) -radix hexadecimal} {/prueba_br/banco_reg/mem(2) -radix hexadecimal} {/prueba_br/banco_reg/mem(3) -radix hexadecimal} {/prueba_br/banco_reg/mem(4) -radix hexadecimal} {/prueba_br/banco_reg/mem(5) -radix hexadecimal} {/prueba_br/banco_reg/mem(6) -radix hexadecimal} {/prueba_br/banco_reg/mem(7) -radix hexadecimal} {/prueba_br/banco_reg/mem(8) -radix hexadecimal} {/prueba_br/banco_reg/mem(9) -radix hexadecimal} {/prueba_br/banco_reg/mem(10) -radix hexadecimal} {/prueba_br/banco_reg/mem(11) -radix hexadecimal} {/prueba_br/banco_reg/mem(12) -radix hexadecimal} {/prueba_br/banco_reg/mem(13) -radix hexadecimal} {/prueba_br/banco_reg/mem(14) -radix hexadecimal} {/prueba_br/banco_reg/mem(15) -radix hexadecimal} {/prueba_br/banco_reg/mem(16) -radix hexadecimal} {/prueba_br/banco_reg/mem(17) -radix hexadecimal} {/prueba_br/banco_reg/mem(18) -radix hexadecimal} {/prueba_br/banco_reg/mem(19) -radix hexadecimal} {/prueba_br/banco_reg/mem(20) -radix hexadecimal} {/prueba_br/banco_reg/mem(21) -radix hexadecimal} {/prueba_br/banco_reg/mem(22) -radix hexadecimal} {/prueba_br/banco_reg/mem(23) -radix hexadecimal} {/prueba_br/banco_reg/mem(24) -radix hexadecimal} {/prueba_br/banco_reg/mem(25) -radix hexadecimal} {/prueba_br/banco_reg/mem(26) -radix hexadecimal} {/prueba_br/banco_reg/mem(27) -radix hexadecimal} {/prueba_br/banco_reg/mem(28) -radix hexadecimal} {/prueba_br/banco_reg/mem(29) -radix hexadecimal} {/prueba_br/banco_reg/mem(30) -radix hexadecimal} {/prueba_br/banco_reg/mem(31) -radix hexadecimal}} -expand -subitemconfig {/prueba_br/banco_reg/mem(0) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(1) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(2) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(3) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(4) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(5) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(6) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(7) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(8) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(9) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(10) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(11) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(12) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(13) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(14) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(15) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(16) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(17) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(18) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(19) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(20) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(21) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(22) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(23) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(24) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(25) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(26) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(27) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(28) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(29) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(30) {-height 16 -radix hexadecimal} /prueba_br/banco_reg/mem(31) {-height 16 -radix hexadecimal}} /prueba_br/banco_reg/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 100
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset {25 ns}
configure wave -gridperiod {50 ns}
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {2000 ns}
