onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_acceso/contador
add wave -noupdate /prueba_acceso/reloj
add wave -noupdate /prueba_acceso/pcero
add wave -noupdate -divider PRODUCTOR
add wave -noupdate /prueba_acceso/escritura
add wave -noupdate /prueba_acceso/PE
add wave -noupdate /prueba_acceso/cola
add wave -noupdate -divider CONSUMIDOR
add wave -noupdate /prueba_acceso/lectura
add wave -noupdate /prueba_acceso/cabeza
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {28349 ps} 0}
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
WaveRestoreZoom {0 ps} {233100 ps}
