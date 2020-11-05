onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /prueba_s1bcd/A
add wave -noupdate -radix unsigned /prueba_s1bcd/B
add wave -noupdate /prueba_s1bcd/cen
add wave -noupdate -radix unsigned /prueba_s1bcd/suma
add wave -noupdate -format Literal /prueba_s1bcd/csal
add wave -noupdate /prueba_s1bcd/error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {33905 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 166
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 8000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {420 ns}
