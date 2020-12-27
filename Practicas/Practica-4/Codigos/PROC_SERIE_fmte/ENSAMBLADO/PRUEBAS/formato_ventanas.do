transcript on
log -r /*
if {[batch_mode] == 0} then { do wave.do }
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
if {[batch_mode] != 0} then { change /prueba_proc_md_mi_fmte/pasoapaso false }
run 0 ns
set StdArithNoWarnings 0
set NumericStdNoWarnings 0
run -all
