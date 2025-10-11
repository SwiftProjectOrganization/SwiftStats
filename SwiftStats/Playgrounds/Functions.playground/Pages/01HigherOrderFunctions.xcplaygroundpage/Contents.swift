//: # SwiftStats: Funtions
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 01 Higher order functions
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

extension Sequence {
  func compactMap<T>(_ transform:(Element) -> T?) -> [T] {
    var result = [T]()
    forEach {
      if let data = transform($0) {
        result.append(data)
      }
    }
    return result
  }
}

let strings = ["1", "two", "3"]
let numbers = strings.compactMap { Int($0) }
let numbers2 = strings.map { Int($0) }
print(numbers)
print(numbers2)

extension Sequence {
  func flatMap<T>(_ transform: (Element) -> [T]) -> [T] {
     var result = [T]()
        forEach {
            result += transform($0)
        }
        return result
    }
}

let nested = [[1, 2], [3, 4], [5]]
let flat = nested.flatMap { $0 }
let flat2 = nested.map { $0 }
print(flat)
print(flat2)

let numbers3: [Int] = [1, 2, 3, 4]
let sum = numbers3.reduce(0, +)
let subtract = numbers3.reduce(0, -)

let evens = numbers3.filter { $0 % 2 == 0 }
