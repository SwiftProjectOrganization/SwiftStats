//: # SwiftStats: StatKit
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 23 Random variables
import Foundation

struct Die {
  func roll() -> Int {
    return .random(in: 1 ... 6)
  }
}

let die = Die()

for _ in 1 ... 5 {
  let rolls = (1 ... 5)
    .map { _ in String(die.roll()) }
    .joined(separator: ", ")
  
print("We rolled \(rolls)")}

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
