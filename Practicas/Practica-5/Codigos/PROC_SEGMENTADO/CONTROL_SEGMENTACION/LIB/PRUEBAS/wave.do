onerror {resume}
transcript off
quietly virtual signal -install /prueba_lib/logica_LIB/R_dat/senyales_cntl { (context /prueba_lib/logica_LIB/R_dat/senyales_cntl )(PBR & PBRA & PBRM & PBRF & PBRE )} PBRs
quietly virtual signal -install /prueba_lib/logica_LIB/R_dat/LDDat { (context /prueba_lib/logica_LIB/R_dat/LDDat )(IDL1A & IDL1M & IDL1F & IDL1E )} DepL1
quietly virtual signal -install /prueba_lib/logica_LIB/R_dat/LDDat { (context /prueba_lib/logica_LIB/R_dat/LDDat )(IDL2A & IDL2M & IDL2F & IDL2E )} DepL2
quietly virtual signal -install /prueba_lib/ok_LIB/R_dat/LDDat { (context /prueba_lib/ok_LIB/R_dat/LDDat )(IDL1A & IDL1M & IDL1F & IDL1E )} DepL1_ok
quietly virtual signal -install /prueba_lib/ok_LIB/R_dat/LDDat { (context /prueba_lib/ok_LIB/R_dat/LDDat )(IDL2A & IDL2M & IDL2F & IDL2E )} DepL2_ok
quietly virtual signal -install /prueba_lib/logica_LIB { (context /prueba_lib/logica_LIB )(R_dat/R_dat/RD & R_Sec/R_sec/RS )} RD_RS
quietly virtual signal -install /prueba_lib { (context /prueba_lib )(bloqCP & bloqBDL & inyecBDL & inyecDLA )} bCP_bDL_iBDL_iDLA
quietly virtual signal -install /prueba_lib/ok_LIB { (context /prueba_lib/ok_LIB )(R_dat/R_dat/RD & R_Sec/R_sec/RS )} RD_RS_ok
quietly virtual signal -install /prueba_lib { (context /prueba_lib )(bloqCP_ok & bloqBDL_ok & inyecBDL_ok & inyecDLA_ok )} bCP_bBDL_iBDL_iDLA_ok
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_lib/ciclo
add wave -noupdate /prueba_lib/reloj
add wave -noupdate /prueba_lib/pcero
add wave -noupdate -divider INSTRUCCIONS
add wave -noupdate -radix hexadecimal /prueba_lib/instrucDL
add wave -noupdate -radix hexadecimal /prueba_lib/instrucA
add wave -noupdate -radix hexadecimal /prueba_lib/instrucM
add wave -noupdate -radix hexadecimal /prueba_lib/instrucF
add wave -noupdate -radix hexadecimal /prueba_lib/instrucE
add wave -noupdate -divider RISCS_GESTIO
add wave -noupdate /prueba_lib/logica_LIB/R_dat/LDDat/DepL1
add wave -noupdate /prueba_lib/logica_LIB/R_dat/LDDat/DepL2
add wave -noupdate /prueba_lib/logica_LIB/RD_RS
add wave -noupdate /prueba_lib/bCP_bDL_iBDL_iDLA
add wave -noupdate -divider RISCS_GESTIO_OK
add wave -noupdate /prueba_lib/ok_LIB/R_dat/LDDat/DepL1_ok
add wave -noupdate /prueba_lib/ok_LIB/R_dat/LDDat/DepL2_ok
add wave -noupdate /prueba_lib/ok_LIB/RD_RS_ok
add wave -noupdate /prueba_lib/bCP_bBDL_iBDL_iDLA_ok
add wave -noupdate -divider IDENTIFICADORS_REGISTRES
add wave -noupdate -radix unsigned /prueba_lib/logica_LIB/R_dat/LDDat/IDL1
add wave -noupdate -radix unsigned /prueba_lib/logica_LIB/R_dat/LDDat/IDL2
add wave -noupdate /prueba_lib/logica_LIB/R_dat/genvalreg/valIDL1
add wave -noupdate /prueba_lib/logica_LIB/R_dat/genvalreg/valIDL2
add wave -noupdate -radix unsigned /prueba_lib/logica_LIB/R_dat/senyales_cntl/rd
add wave -noupdate -radix unsigned /prueba_lib/logica_LIB/R_dat/senyales_cntl/rdA
add wave -noupdate -radix unsigned /prueba_lib/logica_LIB/R_dat/senyales_cntl/rdM
add wave -noupdate -radix unsigned /prueba_lib/logica_LIB/R_dat/senyales_cntl/rdF
add wave -noupdate -radix unsigned /prueba_lib/logica_LIB/R_dat/senyales_cntl/rdE
add wave -noupdate /prueba_lib/logica_LIB/R_dat/senyales_cntl/PBRs
add wave -noupdate -divider SECUEN
add wave -noupdate /prueba_lib/logica_LIB/R_Sec/senyales_cntl/opsec
add wave -noupdate /prueba_lib/logica_LIB/R_Sec/senyales_cntl/opsecA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2120000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 361
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
WaveRestoreZoom {968800 ps} {4664800 ps}
transcript on
