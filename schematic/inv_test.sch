v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 230 -90 270 -90 {lab=vout}
N 270 -90 270 -50 {lab=vout}
C {vsource.sym} -260 -50 0 0 {name=Vdd value=1.8}
C {vsource.sym} -190 -50 0 0 {name=Vin value= "PULSE(0 1.8 0n .1n .1n 5n 10.2n)"
}
C {gnd.sym} -190 -20 0 0 {name=l1 lab=GND}
C {gnd.sym} -260 -20 0 0 {name=l2 lab=GND}
C {lab_pin.sym} -190 -80 1 0 {name=p1 sig_type=std_logic lab=vin}
C {lab_pin.sym} -260 -80 1 0 {name=p2 sig_type=std_logic lab=vdd}
C {code_shown.sym} -290 40 0 0 {name=VTC only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.dc vin 0 2 1m
.tran 0.02n 40n
.save all
.end"}
C {/home/subramanian/VLSI projects/CMOS/inv_vtc.sym} 100 70 0 0 {name=x1}
C {lab_pin.sym} 10 -90 0 0 {name=p3 sig_type=std_logic lab=vin}
C {lab_pin.sym} 80 -160 1 0 {name=p4 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 230 -90 2 0 {name=p5 sig_type=std_logic lab=vout
}
C {gnd.sym} 80 -20 0 0 {name=l3 lab=GND}
C {parax_cap.sym} 270 -40 0 0 {name=C1 gnd=0 value=0.2p m=1}
