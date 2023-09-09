onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib rom_256x16b_opt

do {wave.do}

view wave
view structure
view signals

do {rom_256x16b.udo}

run -all

quit -force
