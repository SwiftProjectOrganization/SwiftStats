//: # SwiftStats: StatKit
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 03 Bernoulli Optimize types types

var lp: [Double] = []
var theta: [Double] = []
(lp, theta) = readBernoulliOptimizeResult()

// Use a named tuple
let res = (lp: lp, theta: theta)
//print((lp: lp, theta: theta))
res.theta

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
