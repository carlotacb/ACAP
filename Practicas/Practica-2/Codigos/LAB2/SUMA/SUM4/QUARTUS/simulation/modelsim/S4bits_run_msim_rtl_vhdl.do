transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/catot/Documents/Personal/UNI/3r Quatri/ACAP/Laboratori/LAB2/LAB2/SUMA/COMPONENTES/SUM1BIT/CODIGO/s1bit.vhd}
vcom -93 -work work {C:/Users/catot/Documents/Personal/UNI/3r Quatri/ACAP/Laboratori/LAB2/LAB2/SUMA/SUM4/CODIGO/S4bits.vhd}

vcom -2008 -work work {C:/Users/catot/Documents/Personal/UNI/3r Quatri/ACAP/Laboratori/LAB2/LAB2/SUMA/SUM4/QUARTUS/../../SUMGENERA/PRUEBAS/prueba_snbits_reloj.vhd}
vcom -93 -work work {C:/Users/catot/Documents/Personal/UNI/3r Quatri/ACAP/Laboratori/LAB2/LAB2/SUMA/SUM4/QUARTUS/../../SUMGENERA/PRUEBAS/snref.vhd}
vcom -93 -work work {C:/Users/catot/Documents/Personal/UNI/3r Quatri/ACAP/Laboratori/LAB2/LAB2/SUMA/SUM4/QUARTUS/../../SUMGENERA/CODIGO/snbits.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L rtl_work -L work -voptargs="+acc"  prueba_snbits_reloj

do C:/Users/catot/Documents/Personal/UNI/3r Quatri/ACAP/Laboratori/LAB2/LAB2/SUMA/SUM4/QUARTUS/../../SUMGENERA/PRUEBAS/formato_ventanas.do
