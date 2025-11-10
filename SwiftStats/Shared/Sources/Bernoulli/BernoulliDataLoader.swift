//
//  BernoulliDataLoader.swift
//  SwiftStats
//
//  Created by Robert Goedman on 11/7/25.
//

import Foundation
import CodableCSV

public enum BernoulliDataLoader {
  
  public enum DataSet: String {
    case bernoulli_optimize = "bernoulli_optimize"
    case bernoulli_samples = "bernoulli_samples"
    case bernoulli_pathfinder = "bernoulli_pathfinder"
    case bernoulli_stansummary = "bernoulli_stansummary"
  }
  
  public static func load<Content: Decodable>(_ type: Content.Type, from dataset: DataSet) -> [Content] {
    let decoder = CSVDecoder {
      $0.headerStrategy = .firstLine
    }
    
    guard
      let bundle = Bundle(identifier: "com.goedman.SwiftStats"),
      let csvURL = bundle.url(forResource: dataset.rawValue, withExtension: "csv")
    else {
      fatalError(
        """
        Could not find \(dataset.rawValue).csv!
        Check it is available in the Data folder.
        """
      )
    }
    print(bundle.bundleURL)
    guard
      let data = try? Data(contentsOf: csvURL),
      let content = try? decoder.decode([Content].self, from: data)
    else {
      fatalError(
        """
        Decoding error!
        """
      )
    }
    
    return content
  }
}
