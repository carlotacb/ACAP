onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal -childformat {{/prueba_salgedpd/Acomp(10) -radix hexadecimal} {/prueba_salgedpd/Acomp(9) -radix hexadecimal} {/prueba_salgedpd/Acomp(8) -radix hexadecimal} {/prueba_salgedpd/Acomp(7) -radix hexadecimal} {/prueba_salgedpd/Acomp(6) -radix hexadecimal} {/prueba_salgedpd/Acomp(5) -radix hexadecimal} {/prueba_salgedpd/Acomp(4) -radix hexadecimal} {/prueba_salgedpd/Acomp(3) -radix hexadecimal} {/prueba_salgedpd/Acomp(2) -radix hexadecimal} {/prueba_salgedpd/Acomp(1) -radix hexadecimal} {/prueba_salgedpd/Acomp(0) -radix hexadecimal}} -subitemconfig {/prueba_salgedpd/Acomp(10) {-radix hexadecimal} /prueba_salgedpd/Acomp(9) {-radix hexadecimal} /prueba_salgedpd/Acomp(8) {-radix hexadecimal} /prueba_salgedpd/Acomp(7) {-radix hexadecimal} /prueba_salgedpd/Acomp(6) {-radix hexadecimal} /prueba_salgedpd/Acomp(5) {-radix hexadecimal} /prueba_salgedpd/Acomp(4) {-radix hexadecimal} /prueba_salgedpd/Acomp(3) {-radix hexadecimal} /prueba_salgedpd/Acomp(2) {-radix hexadecimal} /prueba_salgedpd/Acomp(1) {-radix hexadecimal} /prueba_salgedpd/Acomp(0) {-radix hexadecimal}} /prueba_salgedpd/Acomp
add wave -noupdate -radix hexadecimal /prueba_salgedpd/Bcomp
add wave -noupdate -radix hexadecimal /prueba_salgedpd/sumacomp
add wave -noupdate -radix hexadecimal /prueba_salgedpd/A
add wave -noupdate -radix hexadecimal /prueba_salgedpd/B
add wave -noupdate -radix hexadecimal /prueba_salgedpd/suma
add wave -noupdate -format Literal /prueba_salgedpd/sumres
add wave -noupdate -format Literal /prueba_salgedpd/irre
#add wave -noupdate -format Literal /prueba_salgedpd/csal
add wave -noupdate /prueba_salgedpd/error
add wave -noupdate /prueba_salgedpd/errorexp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {187585 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 220
configure wave -valuecolwidth 47
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 80000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {3281250 ps}
