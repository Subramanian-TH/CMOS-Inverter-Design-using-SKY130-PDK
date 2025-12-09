v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 110 -90 110 -60 {lab=Vout}
C {/home/subramanian/VLSI projects/schematic/inv_vtc.sym} -20 70 0 0 {name=x1}
C {vsource.sym} -390 -50 0 0 {name=Vdd value=1.8}
C {vsource.sym} -320 -50 0 0 {name=Vin value="PULSE(0 1.8 0 .1n .1n 10n 20n 10)"}
C {lab_pin.sym} -110 -90 0 0 {name=p1 sig_type=std_logic lab=Vin}
C {lab_pin.sym} -320 -80 1 0 {name=p2 sig_type=std_logic lab=Vin
}
C {lab_pin.sym} -390 -80 1 0 {name=p3 sig_type=std_logic lab=Vdd}
C {gnd.sym} -40 -20 0 0 {name=l1 lab=GND}
C {gnd.sym} -320 -20 0 0 {name=l2 lab=GND}
C {gnd.sym} -390 -20 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -40 -160 1 0 {name=p4 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 110 -90 2 0 {name=p5 sig_type=std_logic lab=Vout
}
C {code_shown.sym} -240 90 0 0 {name=VTC only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran .02n 100n
.save all 
.end"}
C {parax_cap.sym} 110 -50 0 0 {name=C1 gnd=0 value=.2p m=1}
