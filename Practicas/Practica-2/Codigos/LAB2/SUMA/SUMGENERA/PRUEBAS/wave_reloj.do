onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Entradas
add wave -noupdate -radix hexadecimal /prueba_snbits_reloj/A
add wave -noupdate -radix hexadecimal /prueba_snbits_reloj/B
add wave -noupdate -format Literal /prueba_snbits_reloj/cen
add wave -noupdate -divider Salidas
add wave -noupdate -radix hexadecimal /prueba_snbits_reloj/SUM
add wave -noupdate -format Literal /prueba_snbits_reloj/csal
add wave -noupdate -divider "Modelo referencia"
add wave -noupdate -radix hexadecimal /prueba_snbits_reloj/SUMref
add wave -noupdate -format Literal /prueba_snbits_reloj/csalref
add wave -noupdate -divider Reloj
add wave -noupdate /prueba_snbits_reloj/reloj
add wave -noupdate /prueba_snbits_reloj/errores
add wave -noupdate -format Literal /prueba_snbits_reloj/final
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1400000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 200000
configure wave -gridperiod 400000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {8000 ns}
