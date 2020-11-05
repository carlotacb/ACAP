transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/catot/Desktop/LAB3/buffer_circular/tipos_ctes_pkg/retardos_buffer_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB3/buffer_circular/tipos_ctes_pkg/cte_tipos_buffer_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB3/buffer_circular/COMPONENTES/control_interface/COMPONENTES/acceso/puntero/COMPONENTES/prxval/componentes_prxval_pkg/componentes_prxval_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB3/buffer_circular/COMPONENTES/control_interface/COMPONENTES/acceso/puntero/componentes_puntero_pkg/componentes_puntero_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB3/buffer_circular/COMPONENTES/control_interface/COMPONENTES/acceso/componentes_acceso_pkg/componentes_acceso_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB3/buffer_circular/COMPONENTES/control_interface/COMPONENTES/acceso/puntero/COMPONENTES/cnt_bin/CODIGO/cntbin.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB3/buffer_circular/COMPONENTES/control_interface/COMPONENTES/acceso/puntero/COMPONENTES/prxval/COMPONENTES/mux/CODIGO/mux.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB3/buffer_circular/COMPONENTES/control_interface/COMPONENTES/acceso/puntero/COMPONENTES/registro/CODIGO/reg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB3/buffer_circular/COMPONENTES/control_interface/COMPONENTES/acceso/ENSAMBLADO/CODIGO/acceso.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB3/buffer_circular/COMPONENTES/control_interface/COMPONENTES/acceso/puntero/ENSAMBLADO/CODIGO/puntero.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB3/buffer_circular/COMPONENTES/control_interface/COMPONENTES/acceso/puntero/COMPONENTES/prxval/ENSAMBLADO/CODIGO/prxval.vhd}

vcom -93 -work work {C:/Users/catot/Desktop/LAB3/buffer_circular/COMPONENTES/control_interface/COMPONENTES/acceso/ENSAMBLADO/QUARTUS/../PRUEBAS/procedimientos_prueba_acceso.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB3/buffer_circular/COMPONENTES/control_interface/COMPONENTES/acceso/ENSAMBLADO/QUARTUS/../PRUEBAS/prueba_acceso.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L rtl_work -L work -voptargs="+acc"  prueba_acceso

do C:/Users/catot/Desktop/LAB3/buffer_circular/COMPONENTES/control_interface/COMPONENTES/acceso/ENSAMBLADO/QUARTUS/../PRUEBAS/formato_ventanas.do
