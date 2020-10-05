transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/catot/Documents/Personal/UNI/3r Quatri/ACAP/Laboratori/ACAP-LABs/LAB1/FUNCIONAL/CODIGO/s1bit.vhd}

