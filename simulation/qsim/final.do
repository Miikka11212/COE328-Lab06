onerror {quit -f}
vlib work
vlog -work work final.vo
vlog -work work final.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.SECOND_ALU_vlg_vec_tst
vcd file -direction final.msim.vcd
vcd add -internal SECOND_ALU_vlg_vec_tst/*
vcd add -internal SECOND_ALU_vlg_vec_tst/i1/*
add wave /*
run -all
