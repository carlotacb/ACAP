transcript off
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_alineare/opMD
add wave -noupdate -radix hexadecimal /prueba_alineare/ent
add wave -noupdate -radix hexadecimal /prueba_alineare/sal
#add wave -noupdate /prueba_alineare/formaEscr/dirbyte
#add wave -noupdate /prueba_alineare/formaEscr/SEL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 280
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod {20 ns}
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {200 ns}
transcript on
