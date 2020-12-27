transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/tipos_constantes_pkg/retardos_cntl_seg_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/tipos_constantes_pkg/riscv32_coop_funct_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/tipos_constantes_pkg/retardos_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/tipos_constantes_pkg/retardos_even_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/tipos_constantes_pkg/retardos_RegDes_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/tipos_constantes_pkg/cte_tipos_deco_camino_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/tipos_constantes_pkg/param_disenyo_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/MD/COMPONENTES/ELEMENTOS/mux2m.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/COMPONENTES/PUERTAS/CODIGO/orv2.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/COMPONENTES/PUERTAS/CODIGO/andv1n.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/MI/tipos_ctes_MI_pkg/tipos_constan_memoria_I_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/USecuen/componentes_secuenciamiento_pkg/componentes_secuenciamiento_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/USecuen/componentes_secuenciamiento_pkg/Rcomponentes_secuenciamiento_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/UCalculo/componentes_cam_datos_pkg/componentes_cam_datos_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/UCalculo/componentes_cam_datos_pkg/Rcomponentes_cam_datos_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/AUTO_CONTROL/DECODIFICADOR/CODIGO/componentes_decodificador_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/AUTO_CONTROL/DECODIFICADOR/CODIGO/Rcomponentes_decodificador_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/MD/tipos_ctes_MD_pkg/tipos_constan_memoria_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/tipos_constantes_pkg/cte_tipos_UF_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/componentes_cntl_seg_pkg/componentes_control_seg_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/REGISTRO_DESACOPLO/RegDes_pkg/RegDes_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CP/CODIGO/rregcp.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/MI/ENSAMBLADO_componentes_MI/CODIGO/muxins.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/REGISTRO_DESACOPLO/CODIGO/rdb_dl_n.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/AUTO_CONTROL/DECODIFICADOR/CODIGO/decocamino.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/AUTO_CONTROL/DECODIFICADOR/CODIGO/decoopalu.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/AUTO_CONTROL/DECODIFICADOR/CODIGO/decoopmd.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/AUTO_CONTROL/DECODIFICADOR/CODIGO/deco_excep.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/REGISTRO_DESACOPLO/CODIGO/rdb_n.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/UCalculo/COMPONENTES/FMTD/CODIGO/fmtd.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/REGISTRO_DESACOPLO/CODIGO/rd_n.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/REGISTRO_DESACOPLO/CODIGO/rdi_1.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/REGISTRO_DESACOPLO/CODIGO/rd_1.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/UCalculo/COMPONENTES/BR/CODIGO/br.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/REGISTRO_DESACOPLO/CODIGO/rdi_n.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/UCalculo/COMPONENTES/MULTIPLEXORES/CODIGO/mux3.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/UCalculo/COMPONENTES/MULTIPLEXORES/CODIGO/mux2.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/REGISTRO_DESACOPLO/CODIGO/rd_d.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/USecuen/COMPONENTES/CUATRO/CODIGO/cuatro.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/USecuen/COMPONENTES/SUMADOR/CODIGO/sumador.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/USecuen/COMPONENTES/FMTS/CODIGO/fmts.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/USecuen/COMPONENTES/MULTIPLEXORES/CODIGO/muxdirec.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/USecuen/COMPONENTES/SUMADOR/CODIGO/sum_secu.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/USecuen/COMPONENTES/acceso_MI/CODIGO/acceso_mi.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/MD/COMPONENTES/ACCESO/CODIGO/acceso_md.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/COMPONENTES/VALIDACION/CODIGO/valreg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/COMPONENTES/COMPARADOR/CODIGO/cmp.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/MD/componentes_MD_pkg/componentes_MD_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/MD/componentes_MD_pkg/Rcomponentes_MD_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/MI/componentes_MI_pkg/Rcomponentes_MI_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/componentes_proc_MD_MI_pkg/Rcomponentes_proc_MD_MI_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/MI/memoria_MI/CODIGO/ini_mem_I_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/MD/memoria_ram/CODIGO/ini_mem_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/ENSAMBLADO_DECO_UC_US/CODIGO/rdeco_cam_dat_secu.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/AUTO_CONTROL/DECODIFICADOR/CODIGO/rdecodificador.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/AUTO_CONTROL/DECODIFICADOR/CODIGO/decodificador.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/AUTO_CONTROL/DECODIFICADOR/CODIGO/decoopsec.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/UCalculo/ENSAMBLADO_UC/CODIGO/rcamino_datos.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/UCalculo/COMPONENTES/FMTD/CODIGO/rfmtd.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/UCalculo/COMPONENTES/BR/CODIGO/rbr.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/UCalculo/COMPONENTES/MULTIPLEXORES/CODIGO/rml1.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/UCalculo/COMPONENTES/MULTIPLEXORES/CODIGO/rml2.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/UCalculo/COMPONENTES/ALU/CODIGO/ralu.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/UCalculo/COMPONENTES/ALU/CODIGO/alu.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/UCalculo/COMPONENTES/MULTIPLEXORES/CODIGO/rmes.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/USecuen/DECS/CODIGO/rdecs.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/USecuen/DECS/CODIGO/decs.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/USecuen/ENSAMBLADO_US/CODIGO/rcamino_secuen.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/USecuen/COMPONENTES/FMTS/CODIGO/rfmts.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/USecuen/COMPONENTES/MULTIPLEXORES/CODIGO/rmuxdirec.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/USecuen/COMPONENTES/SUMADOR/CODIGO/rsum_secu.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/USecuen/COMPONENTES/EVALUACION/CODIGO/reval.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/PROCESADOR/CAMINO_DATOS/USecuen/COMPONENTES/EVALUACION/CODIGO/eval.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/USecuen/COMPONENTES/MULTIPLEXORES/CODIGO/rmuxmsic.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/PROCESADOR/CAMINO_DATOS/USecuen/COMPONENTES/MULTIPLEXORES/CODIGO/rmxsecseg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/MD/COMPONENTES/FMTE/COMPONENTES/SELEC_BYTE/CODIGO/sel_byte.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/MD/COMPONENTES/FMTL/COMPONENTES/SEL_SIGNO/CODIGO/fmtl_sel_signo.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/LIB/CODIGO/lib.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/COMPONENTES/DECO_PBR_opSEC/CODIGO/rdecopbropsec.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/COMPONENTES/DECO_PBR_opSEC/CODIGO/decopbropsec.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/COMPONENTES/ENSAM_RD/CODIGO/ensam_rd.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/COMPONENTES/SENYALES_CNTL/CODIGO/senya_cntlrd.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/COMPONENTES/LDD/CODIGO/ldd.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/COMPONENTES/LDRD/CODIGO/ldrd.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/COMPONENTES/ENSAM_RS/CODIGO/ensam_rs.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/COMPONENTES/SENYALES_CNTL/CODIGO/senya_cntlrs.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/COMPONENTES/LDRS/CODIGO/ldrs.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/CONTROL_SEGMENTACION/COMPONENTES/LGR/CODIGO/lgr.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/ENSAMBLADO/CODIGO/Rproc_MD_MI.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/MI/ENSAMBLADO_componentes_MI/CODIGO/rcam_mem_inst_iny_pcero.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/MI/ENSAMBLADO_componentes_MI/CODIGO/rcam_mem_inst.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/MI/memoria_MI/CODIGO/rmi.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/MD/ENSAMBLADO_compontes_memoria/CODIGO/rcam_mem_datos.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/MD/COMPONENTES/FMTE/ENSAMBLADO_FMTE/CODIGO/rfmte.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/MD/COMPONENTES/FMTE/ENSAMBLADO_FMTE/CODIGO/fmte.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/MD/COMPONENTES/FMTE/COMPONENTES/ALINEARE/CODIGO/alineare.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/MD/memoria_ram/CODIGO/rmd.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/MD/COMPONENTES/FMTL/ENSAMBLADO_FMTL/CODIGO/rfmtl.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/MD/COMPONENTES/FMTL/ENSAMBLADO_FMTL/CODIGO/fmtl.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/MD/COMPONENTES/FMTL/COMPONENTES/ALINEAR/CODIGO/alinear.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB4/PROC_SERIE/MD/COMPONENTES/FMTL/COMPONENTES/EXTSIG/CODIGO/fmtl_extsig.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/MD/COMPONENTES/ACCESO/CODIGO/racceso_md.vhd}

vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/ENSAMBLADO/QUARTUS/../../../../LAB4/PROC_SERIE/UTILIDADES_pkg/generar_impri_instruc_pkg/imprimir_inst_ascii_pkg.vhd}
vcom -93 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/ENSAMBLADO/QUARTUS/../../../../LAB4/PROC_SERIE/UTILIDADES_pkg/impri_instruc_pkg/deco_Inst_impri_pkg.vhd}
vcom -2008 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/ENSAMBLADO/QUARTUS/../../UTILIDADES_pkg/imprimir_traza_pkg/impri_traza_pkg.vhd}
vcom -2008 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/ENSAMBLADO/QUARTUS/../../../../LAB4/PROC_SERIE/UTILIDADES_pkg/impri_BR_memoria_pkg/impri_BR_pkg.vhd}
vcom -2008 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/ENSAMBLADO/QUARTUS/../../../../LAB4/PROC_SERIE/UTILIDADES_pkg/impri_BR_memoria_pkg/impri_MD_pkg.vhd}
vcom -2008 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/ENSAMBLADO/QUARTUS/../../../../LAB4/PROC_SERIE/UTILIDADES_pkg/impri_BR_memoria_pkg/impri_MI_pkg.vhd}
vcom -2008 -work work {C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/ENSAMBLADO/QUARTUS/../PRUEBAS/prueba_Rproc_MD_MI.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L rtl_work -L work -voptargs="+acc"  prueba_Rproc_MD_MI

do C:/Users/catot/Desktop/LAB5/PROC_SEGMENTADO/ENSAMBLADO/QUARTUS/../PRUEBAS/formato_ventanas.do
