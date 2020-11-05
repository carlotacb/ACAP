log -r /*
if {[batch_mode] == 0} then { do wave.do }
run -all
