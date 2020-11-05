onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /prueba_snbits/A
add wave -noupdate -radix hexadecimal /prueba_snbits/B
add wave -noupdate /prueba_snbits/cen
add wave -noupdate -radix hexadecimal /prueba_snbits/suma
add wave -noupdate /prueba_snbits/csal
add wave -noupdate /prueba_snbits/error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 169
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {5376 ns}
