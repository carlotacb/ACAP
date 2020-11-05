onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /prueba_bcdadpd/A
add wave -noupdate -radix hexadecimal /prueba_bcdadpd/sa
add wave -noupdate -radix decimal /prueba_bcdadpd/B
add wave -noupdate /prueba_bcdadpd/error
add wave -noupdate /prueba_bcdadpd/estimulos/adec
add wave -noupdate /prueba_bcdadpd/estimulos/adec1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 247
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
WaveRestoreZoom {0 ps} {8055382 ps}
