OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
x q[4];
cx q[0], q[2];
cx q[1], q[3];
h q[4];
t q[2];
t q[3];
t q[4];
cx q[3], q[2];
cx q[4], q[3];
cx q[2], q[4];
tdg q[3];
cx q[2], q[3];
tdg q[2];
tdg q[3];
t q[4];
cx q[4], q[3];
cx q[2], q[4];
cx q[3], q[2];
h q[4];
cx q[2], q[3];
cx q[3], q[4];
