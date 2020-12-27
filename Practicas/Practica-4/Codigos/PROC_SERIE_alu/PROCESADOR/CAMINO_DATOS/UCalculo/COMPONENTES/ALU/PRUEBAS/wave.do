transcript off
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Entradas ALU}
add wave -noupdate -radix hexadecimal /prueba_alu/alu_P/opALU
add wave -noupdate -radix hexadecimal /prueba_alu/alu_P/a
add wave -noupdate -radix hexadecimal /prueba_alu/alu_P/b
add wave -noupdate -divider {Salida ALU}
add wave -noupdate -radix hexadecimal /prueba_alu/alu_P/s
add wave -noupdate -divider {Salida Referencia}
add wave -noupdate -radix hexadecimal /prueba_alu/alu_R/s
add wave -noupdate -divider {Sumador algebraico}
add wave -noupdate -radix hexadecimal /prueba_alu/alu_P/sumalg_M/aa
add wave -noupdate -radix hexadecimal /prueba_alu/alu_P/sumalg_M/bb
add wave -noupdate -radix hexadecimal /prueba_alu/alu_P/sumalg_M/cc
add wave -noupdate -radix hexadecimal /prueba_alu/alu_P/sumalg_M/ss
add wave -noupdate -format Literal /prueba_alu/alu_P/sumalg_M/an
add wave -noupdate -format Literal /prueba_alu/alu_P/sumalg_M/bn
add wave -noupdate -format Literal /prueba_alu/alu_P/sumalg_M/ent
add wave -noupdate -format Literal /prueba_alu/alu_P/sumalg_M/resta
add wave -noupdate -divider {Arbol Multiplexores}
add wave -noupdate -format Literal /prueba_alu/alu_P/mx_01
add wave -noupdate -format Literal /prueba_alu/alu_P/mx_23
add wave -noupdate -format Literal /prueba_alu/alu_P/mx
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {871200000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 269
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {870305859 ps} {872094141 ps}
