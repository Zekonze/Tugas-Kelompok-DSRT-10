v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -320 -140 -320 -30 {lab=#net1}
N -320 -140 -150 -140 {lab=#net1}
N -150 -140 30 -140 {lab=#net1}
N -150 -80 -150 50 {lab=#net2}
N 30 20 30 50 {lab=#net3}
N 30 50 120 50 {lab=#net3}
N 30 110 120 110 {lab=GND}
N 30 110 30 140 {lab=GND}
N -150 110 -150 140 {lab=GND}
N -150 140 30 140 {lab=GND}
N -320 30 -320 140 {lab=GND}
N -320 140 -150 140 {lab=GND}
N 30 -80 30 -40 {lab=#net4}
N -150 -10 -10 -10 {lab=#net2}
N 30 -10 220 -10 {lab=OUTPUT}
C {sky130_fd_pr/nfet_01v8.sym} 10 -10 0 0 {name=M1
W=0.5
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {res.sym} -150 -110 0 0 {name=R1
value=3M
footprint=1206
device=resistor
m=1}
C {res.sym} -150 80 0 0 {name=R2
value=1M
footprint=1206
device=resistor
m=1}
C {res.sym} 30 80 0 0 {name=RS
value=3k
footprint=1206
device=resistor
m=1}
C {res.sym} 30 -110 0 0 {name=R4
value=2k2
footprint=1206
device=resistor
m=1}
C {vsource.sym} -320 0 0 0 {name=V1 value=24 savecurrent=false}
C {gnd.sym} -150 140 0 0 {name=l1 lab=GND}
C {capa.sym} 120 80 0 0 {name=C1
m=1
value=10u
footprint=1206
device="ceramic capacitor"}
C {code.sym} -270 -50 0 0 {name=s1 only_toplevel=false value="

.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

* Discrete JFET Model for the Voltage Divider Circuit
.model jfet_n njf(beta=1m vto=-2.0)
.op
"}
C {code_shown.sym} -850 60 0 0 {name=s2 only_toplevel=false value="

.control

  run

  echo '=== DC OPERATING POINT ==='

  print v(OUTPUT)



  echo '=== SWEEPING SUPPLY TO CHECK STABILITY ==='

  dc V1 0 1.8 0.05

  plot v(OUTPUT)

.endc

"}
C {lab_pin.sym} 220 -10 2 0 {name=p1 sig_type=std_logic lab=OUTPUT}
