transcript on
log -r /*
if {[batch_mode] == 0} then { do wave.do }
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
if {[batch_mode] != 0} then { change /prueba_rproc_md_mi_c_ModSecu_relI/pasoapaso false }
run 0 ns
set StdArithNoWarnings 0
set NumericStdNoWarnings 0
run -all
