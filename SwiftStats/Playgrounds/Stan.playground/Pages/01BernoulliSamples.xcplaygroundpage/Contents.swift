//: # SwiftStats: StatKit
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 01 Bernoulli sample types types

//import Foundation

let basePath = "Stan"
let model = "bernoulli"

var lp: [Double] = []
var theta: [Double] = []
(lp, theta) = readStanBernoulliSamples(
  basePath: basePath,
  model: model,
  filetype: "samples")

theta.median(variable: \.self)
theta.mean(variable: \.self, strategy: .arithmetic)
theta.standardDeviation(variable: \.self, from: .sample)

lp.mean(variable: \.self, strategy: .arithmetic)
lp.standardDeviation(variable: \.self, from: .sample)

// Use a named tuple
let res = (lp: lp, theta: theta)
res.theta

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
