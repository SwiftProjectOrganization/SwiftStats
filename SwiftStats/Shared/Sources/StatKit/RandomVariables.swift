//
//  RandomVariables.swift
//  SwiftStats
//
//  Created by Robert Goedman on 10/6/25.
//

public enum RandomVariables {
  static func run() -> String{
    var therolls: String = ""
    let die = Die()
    for _ in 1 ... 5 {
      therolls = (1 ... 5)
        .map { _ in String(die.roll()) }
        .joined(separator: ", ")
      
    }
    return "We rolled \(therolls)"
  }
}

private struct Die {
  internal func roll() -> Int {
    return .random(in: 1 ... 6)
  }
}

