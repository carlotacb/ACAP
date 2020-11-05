onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Entradas
add wave -noupdate /s1bit/x
add wave -noupdate /s1bit/y
add wave -noupdate /s1bit/cen
add wave -noupdate -divider Salidas
add wave -noupdate /s1bit/csal
add wave -noupdate /s1bit/s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {32320 ps}
