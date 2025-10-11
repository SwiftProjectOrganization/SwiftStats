//: # SwiftStats: StatKit
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 22 Conditional probabilities
import Foundation

let dieRolls = Array(1 ... 6)
let evenRolls = [2, 4, 6]
let oddRolls = [1, 3, 5]

let firstIs1Prob = dieRolls.filter { roll in
  roll == 1
}.count.realValue / dieRolls.count.realValue

let secondIs2Prob = oddRolls.filter { roll in
  roll == 2
}
  .count.realValue / oddRolls.count.realValue

let rollIs4GivenEvenProb = dieRolls.filter {
  roll in  roll == 4
}
  .count.realValue / evenRolls.count.realValue

let rollIsEven = dieRolls.filter { roll in
  roll.isMultiple(of: 2)
}
  .count.realValue / dieRolls.count.realValue

print(
"""
  P[roll2 == 2 | roll1 == 1]*P[roll1 == 1]:  \(secondIs2Prob * firstIs1Prob)
  P[roll1 == 4 | roll1 == even] * P[roll1 == even]:
  \(rollIs4GivenEvenProb * rollIsEven)
"""
)

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
