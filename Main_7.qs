// Create the Bell state phi plus

import Microsoft.Quantum.Diagnostics.*; // Aka Std.Diagnostics.*;

// Create the Main operation that returns two results
operation Main() : (Result, Result) {
    // Allocate the two qubits
     use (q1, q2) = (Qubit(), Qubit());

    // Apply Hadamard gate to q1 and CNot gate to entangle them
    H(q1);
    CNOT(q1, q2);
    DumpMachine(); // Display the current state of both qubits

    // Measure the qubits, store the results and reset the qubits
    let (m1, m2) = (M(q1), M(q2));
    Reset(q1);
    Reset(q2);

    // Show the results
    return (m1, m2);
}