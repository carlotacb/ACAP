transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/catot/Desktop/LAB3/NUCLEO_camino/tipos_ctes_pkg/retardos_nucleo_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB3/NUCLEO_camino/tipos_ctes_pkg/cte_tipos_nucleo_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB3/NUCLEO_camino/COMPONENTES/BR/CODIGO/BR.vhd}

vcom -93 -work work {C:/Users/catot/Desktop/LAB3/NUCLEO_camino/COMPONENTES/BR/QUARTUS/../PRUEBAS/procedimientos_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB3/NUCLEO_camino/COMPONENTES/BR/QUARTUS/../PRUEBAS/prueba_BR.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L rtl_work -L work -voptargs="+acc"  prueba_BR

do C:/Users/catot/Desktop/LAB3/NUCLEO_camino/COMPONENTES/BR/QUARTUS/../PRUEBAS/formato_ventanas.do
