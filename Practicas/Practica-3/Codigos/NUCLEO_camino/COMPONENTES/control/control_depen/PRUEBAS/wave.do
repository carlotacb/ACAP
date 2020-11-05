onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_control/reloj
add wave -noupdate /prueba_control/Pcero
add wave -noupdate /prueba_control/selec
add wave -noupdate /prueba_control/ini
add wave -noupdate /prueba_control/PE
add wave -noupdate -radix unsigned /prueba_control/IDL1
add wave -noupdate -radix unsigned /prueba_control/IDL2
add wave -noupdate -radix unsigned /prueba_control/IDE
add wave -noupdate /prueba_control/controlc/estado
add wave -noupdate -radix unsigned /prueba_control/controlc/cnt
add wave -noupdate /prueba_control/finalop
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 225
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 25000
configure wave -gridperiod 50000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1500 ns}
