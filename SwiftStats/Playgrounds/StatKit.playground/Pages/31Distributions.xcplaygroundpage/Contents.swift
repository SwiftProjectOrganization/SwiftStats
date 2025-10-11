//: # SwiftStats
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 31 Distributions
import Foundation
import StatKit

let normal = NormalDistribution(mean: 0, variance: 1)
normal.cdf(x: 0)

// Generates 10 samples from the normal distribution
let normalRandomVariable = normal.sample(10)

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
