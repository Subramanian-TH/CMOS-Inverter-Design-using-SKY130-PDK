v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 120 50 120 140 {lab=vin}
N 160 80 160 110 {lab=vout}
N 160 50 190 50 {lab=vdd}
N 160 -20 160 20 {lab=vdd}
N 160 170 160 200 {lab=gnd}
N 190 10 190 50 {lab=vdd}
N 160 10 190 10 {lab=vdd}
N 160 140 210 140 {lab=gnd}
N 210 140 210 190 {lab=gnd}
N 160 190 210 190 {lab=gnd}
N 80 100 120 100 {lab=vin}
N 160 100 200 100 {lab=vout}
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} 140 140 0 0 {name=M1
W=1
L=0.15
nf=1 
mult=1
ad="'int((@nf + 1)/2) * @W / @nf * 0.29'" 
pd="'2*int((@nf + 1)/2) * (@W / @nf + 0.29)'"
as="'int((@nf + 2)/2) * @W / @nf * 0.29'" 
ps="'2*int((@nf + 2)/2) * (@W / @nf + 0.29)'"
nrd="'0.29 / @W '" nrs="'0.29 / @W '"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} 140 50 0 0 {name=M2
W=2
L=0.15
nf=1
mult=1
ad="'int((@nf + 1)/2) * @W / @nf * 0.29'" 
pd="'2*int((@nf + 1)/2) * (@W / @nf + 0.29)'"
as="'int((@nf + 2)/2) * @W / @nf * 0.29'" 
ps="'2*int((@nf + 2)/2) * (@W / @nf + 0.29)'"
nrd="'0.29 / @W '" nrs="'0.29 / @W '"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {ipin.sym} 80 100 0 0 {name=p1 lab=vin}
C {ipin.sym} 160 -20 1 0 {name=p2 lab=vdd}
C {opin.sym} 200 100 0 0 {name=p3 lab=vout}
C {ipin.sym} 160 200 3 0 {name=p4 lab=gnd}
