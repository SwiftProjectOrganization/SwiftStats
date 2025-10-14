//: [Previous](@previous)

import Foundation
import Accelerate

let A: [Float] = [3, 6, 1, 5, 8, 0].compactMap { $0 }
let B: [Float] = [2, 6].compactMap { $0 }
var C: [Float] = [0, 0, 0].compactMap { $0 }

let M = Int32(3) // Rows of A
let N = Int32(1) // Columns of B
let K = Int32(2) // Columns of A / Rows of B

vDSP_mmul(A, 1, B, 1, &C, 1, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))

C

//: [Next](@next)
