onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_snbits/A
add wave -noupdate /prueba_snbits/B
add wave -noupdate /prueba_snbits/cen
add wave -noupdate /prueba_snbits/SUM
add wave -noupdate /prueba_snbits/SUMref
add wave -noupdate /prueba_snbits/csal
add wave -noupdate /prueba_snbits/csalref
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 184
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 40000
configure wave -gridperiod 80000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1653758 ps}
