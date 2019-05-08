# cluster-duck
Documentation for the RITSEC cluster.

## Networking

WAN - VLAN 5 - 129.21.0.0/16
Cluster storage - VLAN 8 - 10.0.8.0/24
Public storage - VLAN 9 - 10.0.9.0/24
RITSEC mgmt - VLAN 10 - 10.0.10.0/24
RITSEC IPMI - VLAN 20 - 10.0.20.0/24
RITSEC VXLAN - VLAN 30 - 10.0.30.0/24
User mgmt - 110 - 10.0.110.0/24
User IPMI - 120 - 10.0.120.0/24

## Hardware

Hostnames:

Compute nodes - nova01
- R610s: 01-05
- C6100: 06
- R710s: 07-12
Control plane nodes - mgmt01
- C6100s: 01-03
CEPH OSD nodes - stor01
- SUPs: 01-03

### SANS
Top SAN, Middle SAN

14 x ? GB DIMMS

MOBO: X9DRi-LN4F+

In slots:
- P1-DIMMA1
- P1-DIMMB1
- P1-DIMMC1
- P1-DIMMD1
- P1-DIMMA2
- P1-DIMMB2
- P1-DIMMC2
- P1-DIMMD2

- P2-DIMME1
- P2-DIMMF1
- P2-DIMMG1
- P2-DIMMH1
- P2-DIMME2
- P2-DIMMF2

Bottom SAN

All slots full

12 * 4 GB DIMMs
6 * 8 GB DIMMs

MOBO: X8DAH+-F

### 2U
Control Plane
DIMM0 In 
Number 1 - 6 x 8 GB DIMMS
Number 2 - 6 x 8 GB DIMMS
Number 3 - 6 x 8 GB DIMMS

Compute Node
Number 4 - 12 * 8 GB DIMMS

## KB - STOR01 incident
P1-DIMMB1 is dead, this means that all of the B channel is unusable

4 GB DIMMs in P1-DIMMA1 and P1-DIMMC1
8 GB DIMMs in:
- P1-DIMMA2
- P1-DIMMC2
- P1-DIMMD1
- P1-DIMMD2

- P2-DIMME1
- P2-DIMME2
- P2-DIMMF1
- P2-DIMMF2
- P2-DIMMG1
- P2-DIMMG2

## KB - C6100 BMC Firmware
BMC firmware was causing instability issues when working in bios, etc.

https://www.dell.com/community/PowerEdge-Hardware-General/PE-C6100-XS23-TY-BMC-Not-Alive-Not-Present-Recovery-Procedure/td-p/4740214

**make sure to do `..\[ROM filename]` in the last command**