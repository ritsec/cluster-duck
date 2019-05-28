# cluster-duck

Documentation for the RITSEC cloud.


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

## KB - C6100 BMC Firmware
BMC firmware was causing instability issues when working in bios, etc.

https://www.dell.com/community/PowerEdge-Hardware-General/PE-C6100-XS23-TY-BMC-Not-Alive-Not-Present-Recovery-Procedure/td-p/4740214

**make sure to do `..\[ROM filename]` in the last command**