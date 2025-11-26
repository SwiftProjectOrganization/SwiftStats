//: # SwiftStats: StatKit
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 02 Bernoulli StanSummary types

let basePath = "Stan"
let model = "bernoulli"

let bernoulli_stansummary = readBernoulliStanSummary(
  basePath: basePath,
  model: model,
  filetype: "stansummary")

bernoulli_stansummary["theta"]

bernoulli_stansummary["theta"]!.mean

bernoulli_stansummary["theta"]!.mad

bernoulli_stansummary["theta"]!.mcse

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next
