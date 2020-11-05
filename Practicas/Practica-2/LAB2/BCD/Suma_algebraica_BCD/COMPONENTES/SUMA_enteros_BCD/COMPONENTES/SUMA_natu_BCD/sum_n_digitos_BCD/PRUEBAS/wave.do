onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal -childformat {{/prueba_snbcd/A(7) -radix unsigned} {/prueba_snbcd/A(6) -radix unsigned} {/prueba_snbcd/A(5) -radix unsigned} {/prueba_snbcd/A(4) -radix unsigned} {/prueba_snbcd/A(3) -radix unsigned} {/prueba_snbcd/A(2) -radix unsigned} {/prueba_snbcd/A(1) -radix unsigned} {/prueba_snbcd/A(0) -radix unsigned}} -subitemconfig {/prueba_snbcd/A(7) {-radix unsigned} /prueba_snbcd/A(6) {-radix unsigned} /prueba_snbcd/A(5) {-radix unsigned} /prueba_snbcd/A(4) {-radix unsigned} /prueba_snbcd/A(3) {-radix unsigned} /prueba_snbcd/A(2) {-radix unsigned} /prueba_snbcd/A(1) {-radix unsigned} /prueba_snbcd/A(0) {-radix unsigned}} /prueba_snbcd/A
add wave -noupdate -radix hexadecimal -childformat {{/prueba_snbcd/B(7) -radix unsigned} {/prueba_snbcd/B(6) -radix unsigned} {/prueba_snbcd/B(5) -radix unsigned} {/prueba_snbcd/B(4) -radix unsigned} {/prueba_snbcd/B(3) -radix unsigned} {/prueba_snbcd/B(2) -radix unsigned} {/prueba_snbcd/B(1) -radix unsigned} {/prueba_snbcd/B(0) -radix unsigned}} -subitemconfig {/prueba_snbcd/B(7) {-radix unsigned} /prueba_snbcd/B(6) {-radix unsigned} /prueba_snbcd/B(5) {-radix unsigned} /prueba_snbcd/B(4) {-radix unsigned} /prueba_snbcd/B(3) {-radix unsigned} /prueba_snbcd/B(2) {-radix unsigned} /prueba_snbcd/B(1) {-radix unsigned} /prueba_snbcd/B(0) {-radix unsigned}} /prueba_snbcd/B
add wave -noupdate -format Literal /prueba_snbcd/cen
add wave -noupdate -radix hexadecimal -childformat {{/prueba_snbcd/suma(7) -radix unsigned} {/prueba_snbcd/suma(6) -radix unsigned} {/prueba_snbcd/suma(5) -radix unsigned} {/prueba_snbcd/suma(4) -radix unsigned} {/prueba_snbcd/suma(3) -radix unsigned} {/prueba_snbcd/suma(2) -radix unsigned} {/prueba_snbcd/suma(1) -radix unsigned} {/prueba_snbcd/suma(0) -radix unsigned}} -subitemconfig {/prueba_snbcd/suma(7) {-radix unsigned} /prueba_snbcd/suma(6) {-radix unsigned} /prueba_snbcd/suma(5) {-radix unsigned} /prueba_snbcd/suma(4) {-radix unsigned} /prueba_snbcd/suma(3) {-radix unsigned} /prueba_snbcd/suma(2) {-radix unsigned} /prueba_snbcd/suma(1) {-radix unsigned} /prueba_snbcd/suma(0) {-radix unsigned}} /prueba_snbcd/suma
add wave -noupdate -format Literal /prueba_snbcd/csal
add wave -noupdate /prueba_snbcd/error
add wave -noupdate -divider {digito 0}
add wave -noupdate -radix unsigned /prueba_snbcd/sndigiBCD/sumador(0)/sumi/X
add wave -noupdate -radix unsigned /prueba_snbcd/sndigiBCD/sumador(0)/sumi/Y
add wave -noupdate -format Literal /prueba_snbcd/sndigiBCD/sumador(0)/sumi/cen
add wave -noupdate -radix unsigned /prueba_snbcd/sndigiBCD/sumador(0)/sumi/S
add wave -noupdate -format Literal /prueba_snbcd/sndigiBCD/sumador(0)/sumi/csal
add wave -noupdate -divider {digito 1}
add wave -noupdate -radix unsigned /prueba_snbcd/sndigiBCD/sumador(1)/sumi/X
add wave -noupdate -radix unsigned /prueba_snbcd/sndigiBCD/sumador(1)/sumi/Y
add wave -noupdate -format Literal /prueba_snbcd/sndigiBCD/sumador(1)/sumi/cen
add wave -noupdate -radix unsigned /prueba_snbcd/sndigiBCD/sumador(1)/sumi/S
add wave -noupdate -format Literal /prueba_snbcd/sndigiBCD/sumador(1)/sumi/csal
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {128849 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 321
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 20000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {820314 ps}
