// Exercise Part 1 - Create a quantum random bit generator

// 1. imports standard functions from Microsoft
import Std.Intrinsic.*;

// 2. Define the Main operation
operation Main() : Result {
    
    // 3. Allocate a qubit
    use q = Qubit();

    // 4. Put the qubit into superposition (every qubit you allocate starts in the 0-state by default) through the Hadamard function
    // The Hadamard operation changes the state of the qubit and puts it into an equal superposition of 0 and 1
    H(q);

    // 5. Measure the qubit
    let result = M(q);

    // 6. Reset the qubit
    Reset(q);

    // 7. Return the measurement result
    return result;



}
