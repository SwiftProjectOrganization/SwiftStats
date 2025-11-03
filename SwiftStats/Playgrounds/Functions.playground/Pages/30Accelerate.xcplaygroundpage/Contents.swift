//: [Previous](@previous)

import Foundation
import Accelerate

[[1.0, 2.0], [3.0, 4.0]].flatMap { $0 }

let a: [Double] = [1.0, 2.0, 3.0, 4.0]
let b: [Double] = [5.0, 6.0, 7.0, 8.0]
var c = [Double](repeating: 0.0, count: 4)

cblas_dgemm(CblasRowMajor , CblasNoTrans, CblasNoTrans, 2, 2, 2, 1.0, a, 2, b, 2, 0.0, &c, 2)

c

// c will be [19, 22, 43, 50] representing [[19, 22], [43, 50]] (row major)

cblas_dgemm(CblasColMajor , CblasNoTrans, CblasNoTrans, 2, 2, 2, 1.0, a, 2, b, 2, 0.0, &c, 2)

c

// z will be [23, 34, 31, 46] representing [[19, 22], [43, 50]] (column major)

let x: [Float] = [1.0, 2.0, 3.0, 4.0]
let y: [Float] = [5.0, 6.0, 7.0, 8.0]
var z = [Float](repeating: 0.0, count: 4)

cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, 2, 2, 2, 1.0, x, 2, y, 2, 0.0, &z, 2)

z

let m1 = [[1, 2, 3], [3, 4, 5]]
m1.count
m1[0].count

let m2 = [[], []]
m2.count
m2[0].count

//: [Next](@next)
