onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Entradas
add wave -noupdate /prueba_s4bits/A
add wave -noupdate /prueba_s4bits/B
add wave -noupdate /prueba_s4bits/cen
add wave -noupdate -divider Salidas
add wave -noupdate /prueba_s4bits/Sum
add wave -noupdate /prueba_s4bits/csal
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 184
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {1296750 ps}
