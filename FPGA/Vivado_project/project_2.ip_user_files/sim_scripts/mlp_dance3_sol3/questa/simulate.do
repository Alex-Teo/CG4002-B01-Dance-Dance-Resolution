onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib mlp_dance3_sol3_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {mlp_dance3_sol3.udo}

run -all

quit -force
