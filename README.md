# Quantum Half-Adder

> **Category**: arithmetic &nbsp;|&nbsp; **Difficulty**: beginner &nbsp;|&nbsp; **Qubits**: 3 &nbsp;|&nbsp; **Gates**: 5 &nbsp;|&nbsp; **Depth**: 4

A quantum half-adder computes the sum and carry of two 1-bit numbers reversibly. The carry is computed using a Toffoli (CCX) gate (AND), and the sum using a CNOT (XOR). Because quantum gates are reversible, the input is not destroyed. This is a primitive building block of quantum arithmetic used in Shor's algorithm and quantum simulation. This circuit adds a=1, b=1 → sum=0, carry=1.

## Expected Output

c[0]=0 (sum=0), c[1]=1 (carry=1) — correct for 1+1=10

## Circuit

The OpenQASM 2.0 circuit is in [`circuit.qasm`](./circuit.qasm).

```
OPENQASM 2.0;
include "qelib1.inc";
// Quantum half-adder: a=1, b=1 -> sum=0, carry=1
// q[0]=a, q[1]=b, q[2]=carry ancilla
qreg q[3];
creg c[2];
// Initialize inputs: a=1, b=1
x q[0];
x q[1];
// Carry = a AND b (Toffoli)
ccx q[0],q[1],q[2];
// Sum = a XOR b (CNOT)
cx q[0],q[1];
// q[1] now holds sum, q[2] holds carry
measure q[1] -> c[0];
measure q[2] -> c[1];
```

## Tags

`arithmetic` `adder` `reversible` `toffoli`

## References

- [Vedral, Barenco, Ekert (1996). Quantum Networks for Elementary Arithmetic Operations. PRA 54(1)](https://doi.org/10.1103/PhysRevA.54.147)

## License

MIT — part of the [OpenQC Algorithm Catalog](https://github.com/openqc-algorithms).
