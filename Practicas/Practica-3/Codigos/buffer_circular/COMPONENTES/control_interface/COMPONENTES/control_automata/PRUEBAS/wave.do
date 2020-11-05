onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_control/reloj
add wave -noupdate /prueba_control/pcero
add wave -noupdate /prueba_control/cabeza
add wave -noupdate /prueba_control/cola
add wave -noupdate /prueba_control/vacio
add wave -noupdate /prueba_control/lleno
add wave -noupdate /prueba_control/lectura
add wave -noupdate /prueba_control/escritura
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {86243 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 199
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 10000
configure wave -gridperiod 20000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {840 ns}
