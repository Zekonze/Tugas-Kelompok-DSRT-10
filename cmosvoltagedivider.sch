v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -320 -140 -320 -30 {lab=INPUT}
N -320 -140 -150 -140 {lab=INPUT}
N -150 -140 30 -140 {lab=INPUT}
N -150 -80 -150 50 {lab=#net1}
N 30 20 30 50 {lab=#net2}
N 30 110 30 140 {lab=GND}
N -150 110 -150 140 {lab=GND}
N -150 140 30 140 {lab=GND}
N -320 30 -320 140 {lab=GND}
N -320 140 -150 140 {lab=GND}
N 30 -80 30 -40 {lab=OUTPUT}
N -150 -10 -10 -10 {lab=#net1}
N 30 -10 30 20 {lab=#net2}
N 30 -50 220 -50 {lab=OUTPUT}
N -410 -80 -320 -80 {lab=INPUT}
N -420 -40 -410 -80 {lab=INPUT}
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
value=100
footprint=1206
device=resistor
m=1}
C {res.sym} 30 -110 0 0 {name=R4
value=6.8k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -320 0 0 0 {name=V1 value=24 savecurrent=false}
C {gnd.sym} -150 140 0 0 {name=l1 lab=GND}
C {code.sym} -270 -50 0 0 {name=s1 only_toplevel=false value="

.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

* Discrete JFET Model for the Voltage Divider Circuit
.model jfet_n njf(beta=1m vto=-2.0)
.op
"}
C {code_shown.sym} -850 60 0 0 {name=s2 only_toplevel=false value="

.control
  run
  echo '=== TRANSIENT ANALYSIS (STATIC 24V) ==='
  
  * Run a transient simulation for 1 millisecond with a 1 microsecond step
  tran 1u 1m
  
  * Plot both the INPUT node and OUTPUT node on the same graph
  plot v(INPUT) v(OUTPUT)
.endc
"}
C {lab_pin.sym} 220 -50 2 0 {name=p1 sig_type=std_logic lab=OUTPUT}
C {lab_pin.sym} -420 -40 0 0 {name=p2 sig_type=std_logic lab=INPUT
}
