onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider reloj
add wave -noupdate /prueba_camino_control/cntciclos
add wave -noupdate /prueba_camino_control/reloj
add wave -noupdate -divider {senyales externas}
add wave -noupdate -radix unsigned /prueba_camino_control/camino_cnt/IDL1ini
add wave -noupdate /prueba_camino_control/camino_cnt/PEini
add wave -noupdate -radix unsigned /prueba_camino_control/camino_cnt/IDEini
add wave -noupdate -radix unsigned /prueba_camino_control/camino_cnt/DEini
add wave -noupdate -divider control
add wave -noupdate /prueba_camino_control/camino_cnt/controlDE/Pcero
add wave -noupdate /prueba_camino_control/camino_cnt/controlDE/ini
add wave -noupdate /prueba_camino_control/camino_cnt/controlDE/finalop
add wave -noupdate -format Literal /prueba_camino_control/camino_cnt/controlDE/estado
add wave -noupdate -radix unsigned /prueba_camino_control/camino_cnt/controlDE/cnt
add wave -noupdate -radix unsigned /prueba_camino_control/camino_cnt/controlDE/IDL1
add wave -noupdate -radix unsigned /prueba_camino_control/camino_cnt/controlDE/IDL2
add wave -noupdate /prueba_camino_control/camino_cnt/controlDE/PE
add wave -noupdate -radix unsigned /prueba_camino_control/camino_cnt/controlDE/IDE
add wave -noupdate /prueba_camino_control/camino_cnt/controlDE/selec
add wave -noupdate -divider {camino de datos}
add wave -noupdate -radix unsigned /prueba_camino_control/camino_cnt/bancoregistro/IDL1
add wave -noupdate -radix unsigned /prueba_camino_control/camino_cnt/bancoregistro/IDL2
add wave -noupdate -radix unsigned /prueba_camino_control/camino_cnt/bancoregistro/LE1
add wave -noupdate -radix unsigned /prueba_camino_control/camino_cnt/bancoregistro/LE2
add wave -noupdate -radix unsigned /prueba_camino_control/camino_cnt/DEsum
add wave -noupdate /prueba_camino_control/camino_cnt/bancoregistro/PE
add wave -noupdate -radix unsigned /prueba_camino_control/camino_cnt/bancoregistro/IDE
add wave -noupdate -radix unsigned /prueba_camino_control/camino_cnt/bancoregistro/DE
add wave -noupdate -divider registros
add wave -noupdate -radix unsigned -childformat {{/prueba_camino_control/camino_cnt/bancoregistro/mem(0) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(1) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(2) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(3) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(4) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(5) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(6) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(7) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(8) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(9) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(10) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(11) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(12) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(13) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(14) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(15) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(16) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(17) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(18) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(19) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(20) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(21) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(22) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(23) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(24) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(25) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(26) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(27) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(28) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(29) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(30) -radix unsigned} {/prueba_camino_control/camino_cnt/bancoregistro/mem(31) -radix unsigned}} -expand -subitemconfig {/prueba_camino_control/camino_cnt/bancoregistro/mem(0) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(1) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(2) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(3) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(4) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(5) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(6) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(7) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(8) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(9) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(10) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(11) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(12) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(13) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(14) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(15) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(16) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(17) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(18) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(19) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(20) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(21) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(22) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(23) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(24) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(25) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(26) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(27) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(28) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(29) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(30) {-height 16 -radix unsigned} /prueba_camino_control/camino_cnt/bancoregistro/mem(31) {-height 16 -radix unsigned}} /prueba_camino_control/camino_cnt/bancoregistro/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 443
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {1735874 ps}
