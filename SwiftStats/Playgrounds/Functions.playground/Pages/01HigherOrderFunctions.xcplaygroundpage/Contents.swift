//: # SwiftStats
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 20 Higher order functions


import Foundation

extension Sequence {
  func customMap<T>(_ transform: (Element) -> T) -> [T] {
    var result = [T]()
    forEach {
      result.append(transform($0))
    }
    return result
  }
}

let selection = [1, 2, 3, 3, 2, 4].customMap { $0 * $0 }

let selection2 = selection.map { $0 * $0 }

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
