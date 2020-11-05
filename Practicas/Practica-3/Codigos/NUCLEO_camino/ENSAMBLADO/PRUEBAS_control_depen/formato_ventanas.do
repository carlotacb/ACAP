log -r /*
do wave.do
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
run 0 ps
set StdArithNoWarnings 0
set NumericStdNoWarnings 0
run -all
