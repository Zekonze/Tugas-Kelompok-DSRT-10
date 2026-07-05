v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 140 -40 140 -30 {lab=input}
N 140 -40 210 -40 {lab=input}
N 210 -40 210 -10 {lab=input}
N 140 30 140 60 {lab=GND}
N 140 40 210 40 {lab=GND}
N 210 10 210 40 {lab=GND}
N 210 -60 210 -40 {lab=input}
N 510 -10 530 -10 {lab=output}
C {code.sym} 220 50 0 0 {name=script only_toplevel=false value="
.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include voltagedivider.spice

.option wnflag=0
.option savecurrents

.control
  save v(input) v(output)
  
  * Using your friend's style, but optimized to 40 microseconds
  tran 0.1u 40u
  
  * Plotting with matching lowercase net names
  plot v(input) v(output) title 'Transient Response'
.endc"}
C {vsource.sym} 140 0 0 0 {name=V1 value=3.3 savecurrent=false}
C {lab_pin.sym} 210 -60 0 0 {name=p1 sig_type=std_logic lab=input}
C {gnd.sym} 140 60 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 530 -10 2 0 {name=p2 sig_type=std_logic lab=output}
