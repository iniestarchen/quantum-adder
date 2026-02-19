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
