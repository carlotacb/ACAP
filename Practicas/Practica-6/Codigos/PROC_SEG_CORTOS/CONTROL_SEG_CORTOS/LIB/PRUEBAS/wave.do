onerror {resume}
quietly virtual signal -install /prueba_lib_c/logica_LIB/R_dat/senyales_cntl { (context /prueba_lib_c/logica_LIB/R_dat/senyales_cntl )(PBR & PBRA & PBRM & PBRF & PBRE )} PBRs
quietly virtual signal -install /prueba_lib_c/logica_LIB/R_dat/LDDat { (context /prueba_lib_c/logica_LIB/R_dat/LDDat )(IDL1A & IDL1M & IDL1F & IDL1E )} DepL1
quietly virtual signal -install /prueba_lib_c/logica_LIB/R_dat/LDDat { (context /prueba_lib_c/logica_LIB/R_dat/LDDat )(IDL2A & IDL2M & IDL2F & IDL2E )} DepL2
quietly virtual signal -install /prueba_lib_c/logica_LIB/R_dat/cortos { (context /prueba_lib_c/logica_LIB/R_dat/cortos )(C4L1 & C3L1 & C2L1 & C1L1 )} CL1
quietly virtual signal -install /prueba_lib_c/logica_LIB/R_dat/cortos { (context /prueba_lib_c/logica_LIB/R_dat/cortos )(C4L2 & C3L2 & C2L2 & C1L2 )} CL2
quietly virtual signal -install /prueba_lib_c { (context /prueba_lib_c )(bloqCP & bloqBDL & inyecBDL & inyecDLA )} bCP_bBDL_iBDL_iDLA
quietly virtual signal -install /prueba_lib_c { (context /prueba_lib_c )(bloqCP_ok & bloqBDL_ok & inyecBDL_ok & inyecDLA_ok )} bCP_bBDL_iBDL_iDLA_ok
quietly virtual signal -install /prueba_lib_c/logica_LIB { (context /prueba_lib_c/logica_LIB )(R_dat/R_dat/RD & R_Sec/R_sec/RS )} RD_RS
quietly virtual signal -install /prueba_lib_c/ok_LIB { (context /prueba_lib_c/ok_LIB )(R_dat/R_dat/RD & R_Sec/R_sec/RS )} RD_RS_ok
quietly virtual signal -install /prueba_lib_c { (context /prueba_lib_c )(C1L1_ok & C2L1_ok & C3L1_ok & C4L1_ok )} CL1_ok
quietly virtual signal -install /prueba_lib_c { (context /prueba_lib_c )(C1L2_ok & C2L2_ok & C3L2_ok & C4L2_ok )} CL2_ok
quietly virtual signal -install /prueba_lib_c { (context /prueba_lib_c )(C1L1 & C2L1 & C3L1 & C4L1 )} CL1
quietly virtual signal -install /prueba_lib_c { (context /prueba_lib_c )(C1L2 & C2L2 & C3L2 & C4L2 )} CL2
quietly virtual signal -install /prueba_lib_c/logica_LIB/R_dat { (context /prueba_lib_c/logica_LIB/R_dat )(latphA & latphM )} latphA_M
quietly virtual signal -install /prueba_lib_c/ok_LIB/R_dat { (context /prueba_lib_c/ok_LIB/R_dat )(latphA & latphM )} latph_A_M_ok
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_lib_c/ciclo
add wave -noupdate /prueba_lib_c/reloj
add wave -noupdate /prueba_lib_c/pcero
add wave -noupdate -divider INSTRUCCIONS
add wave -noupdate -radix hexadecimal /prueba_lib_c/instrucB
add wave -noupdate -radix hexadecimal /prueba_lib_c/instrucDL
add wave -noupdate -radix hexadecimal /prueba_lib_c/instrucA
add wave -noupdate -radix hexadecimal /prueba_lib_c/instrucM
add wave -noupdate -radix hexadecimal /prueba_lib_c/instrucF
add wave -noupdate -radix hexadecimal /prueba_lib_c/instrucE
add wave -noupdate -divider CURTCIRCUITS
add wave -noupdate /prueba_lib_c/CL1
add wave -noupdate /prueba_lib_c/CL2
add wave -noupdate -divider CURTCIRCUITS_OK
add wave -noupdate /prueba_lib_c/CL1_ok
add wave -noupdate /prueba_lib_c/CL2_ok
add wave -noupdate -divider RISCS_GESTIO
add wave -noupdate /prueba_lib_c/logica_LIB/R_dat/latphA_M
add wave -noupdate /prueba_lib_c/logica_LIB/RD_RS
add wave -noupdate /prueba_lib_c/bCP_bBDL_iBDL_iDLA
add wave -noupdate -divider RISCS_GESTIO_OK
add wave -noupdate /prueba_lib_c/ok_LIB/R_dat/latph_A_M_ok
add wave -noupdate /prueba_lib_c/ok_LIB/RD_RS_ok
add wave -noupdate /prueba_lib_c/bCP_bBDL_iBDL_iDLA_ok
add wave -noupdate -divider IDENTIFICADORS_REGISTRES
add wave -noupdate -radix unsigned /prueba_lib_c/logica_LIB/R_dat/LDDat/IDL1
add wave -noupdate -radix unsigned /prueba_lib_c/logica_LIB/R_dat/LDDat/IDL2
add wave -noupdate /prueba_lib_c/logica_LIB/R_dat/genvalreg/valIDL1
add wave -noupdate /prueba_lib_c/logica_LIB/R_dat/genvalreg/valIDL2
add wave -noupdate -radix unsigned /prueba_lib_c/logica_LIB/R_dat/senyales_cntl/rd
add wave -noupdate -radix unsigned /prueba_lib_c/logica_LIB/R_dat/senyales_cntl/rdA
add wave -noupdate -radix unsigned /prueba_lib_c/logica_LIB/R_dat/senyales_cntl/rdM
add wave -noupdate -radix unsigned /prueba_lib_c/logica_LIB/R_dat/senyales_cntl/rdF
add wave -noupdate -radix unsigned /prueba_lib_c/logica_LIB/R_dat/senyales_cntl/rdE
add wave -noupdate /prueba_lib_c/logica_LIB/R_dat/senyales_cntl/PBRs
add wave -noupdate /prueba_lib_c/logica_LIB/R_dat/LDDat/DepL1
add wave -noupdate /prueba_lib_c/logica_LIB/R_dat/LDDat/DepL2
add wave -noupdate -divider SECUEN
add wave -noupdate /prueba_lib_c/logica_LIB/R_Sec/senyales_cntl/opsec
add wave -noupdate /prueba_lib_c/logica_LIB/R_Sec/senyales_cntl/opsecA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1320000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 368
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 40000
configure wave -gridperiod 80000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {399218 ps} {2240782 ps}
