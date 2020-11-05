onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_buffer_circular/cntciclos
add wave -noupdate /prueba_buffer_circular/reloj
add wave -noupdate /prueba_buffer_circular/pcero
add wave -noupdate /prueba_buffer_circular/inicio
add wave -noupdate -divider PRODUCTOR
add wave -noupdate /prueba_buffer_circular/validoP
add wave -noupdate /prueba_buffer_circular/listoB
add wave -noupdate -radix hexadecimal /prueba_buffer_circular/datoE
add wave -noupdate -divider CONSUMIDOR
add wave -noupdate /prueba_buffer_circular/validoB
add wave -noupdate /prueba_buffer_circular/listoC
add wave -noupdate -radix hexadecimal /prueba_buffer_circular/datoL
add wave -noupdate -divider {Salida consumidor}
add wave -noupdate -radix hexadecimal /prueba_buffer_circular/valDATcons 
add wave -noupdate -radix hexadecimal /prueba_buffer_circular/DATprocesado
add wave -noupdate -divider BUFFER_CIRCULAR
add wave -noupdate /prueba_buffer_circular/buffercir/buffercontrol/escritura
add wave -noupdate -radix hexadecimal /prueba_buffer_circular/buffercir/cola
add wave -noupdate /prueba_buffer_circular/buffercir/buffercontrol/lleno
add wave -noupdate /prueba_buffer_circular/buffercir/PE
add wave -noupdate /prueba_buffer_circular/buffercir/buffercontrol/lectura
add wave -noupdate -radix hexadecimal /prueba_buffer_circular/buffercir/cabeza
add wave -noupdate /prueba_buffer_circular/buffercir/buffercontrol/vacio
add wave -noupdate -divider REGISTROS
add wave -noupdate -radix hexadecimal -childformat {{/prueba_buffer_circular/buffercir/bancoregistros/registros(0) -radix hexadecimal} {/prueba_buffer_circular/buffercir/bancoregistros/registros(1) -radix hexadecimal} {/prueba_buffer_circular/buffercir/bancoregistros/registros(2) -radix hexadecimal} {/prueba_buffer_circular/buffercir/bancoregistros/registros(3) -radix hexadecimal} {/prueba_buffer_circular/buffercir/bancoregistros/registros(4) -radix hexadecimal} {/prueba_buffer_circular/buffercir/bancoregistros/registros(5) -radix hexadecimal} {/prueba_buffer_circular/buffercir/bancoregistros/registros(6) -radix hexadecimal} {/prueba_buffer_circular/buffercir/bancoregistros/registros(7) -radix hexadecimal}} -expand -subitemconfig {/prueba_buffer_circular/buffercir/bancoregistros/registros(0) {-height 16 -radix hexadecimal} /prueba_buffer_circular/buffercir/bancoregistros/registros(1) {-height 16 -radix hexadecimal} /prueba_buffer_circular/buffercir/bancoregistros/registros(2) {-height 16 -radix hexadecimal} /prueba_buffer_circular/buffercir/bancoregistros/registros(3) {-height 16 -radix hexadecimal} /prueba_buffer_circular/buffercir/bancoregistros/registros(4) {-height 16 -radix hexadecimal} /prueba_buffer_circular/buffercir/bancoregistros/registros(5) {-height 16 -radix hexadecimal} /prueba_buffer_circular/buffercir/bancoregistros/registros(6) {-height 16 -radix hexadecimal} /prueba_buffer_circular/buffercir/bancoregistros/registros(7) {-height 16 -radix hexadecimal}} /prueba_buffer_circular/buffercir/bancoregistros/registros
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {656144 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 349
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 15000
configure wave -gridperiod 30000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1228500 ps}
