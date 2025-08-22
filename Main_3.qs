// Exercise Part 3 - Create a quantum random number generator with min and max

// 1. Import the required libraries
import Microsoft.Quantum.Convert.*;
import Microsoft.Quantum.Math.*;

// 2. Generates a random number between min and max.
operation GenerateRandomNumberInRange(min : Int, max : Int) : Int {
    // Calculate the valid range
    let range = max - min;

    // Determine the number of bits needed to represent `range`
    mutable bits = [];
    let nBits = BitSizeI(range);

    for idxBit in 1..nBits {
        set bits += [GenerateRandomBit()];
    }

    let sample = ResultArrayAsInt(bits);

    // Check if the number is within the range; if not, generate again
    return sample > range 
        ? GenerateRandomNumberInRange(min, max) 
        | (sample + min);
}

// 3. Generates a single random bit using a qubit
operation GenerateRandomBit() : Result {
    // Allocate a qubit
    use q = Qubit();

    // Put the qubit into superposition using Hadamard
    H(q);

    // Measure the qubit and store the result
    let result = M(q);

    // Reset qubit back to the |0〉 state
    Reset(q);

    // Return the measurement result
    return result;
}

// 4. Main operation
operation Main() : Int {
    let min = 10;
    let max = 100;
    Message($"Sampling a random number between {min} and {max}: ");

    // Generate random number in the min..max range
    return GenerateRandomNumberInRange(min, max);
}
