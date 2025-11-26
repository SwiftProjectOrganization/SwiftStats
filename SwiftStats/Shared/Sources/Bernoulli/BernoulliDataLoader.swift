//
//  BernoulliDataLoader.swift
//  SwiftStats
//
//  Created by Robert Goedman on 11/7/25.
//

import Foundation
import CodableCSV

public enum StanBernoulliDataLoader {
  public enum DataSet: String {
    case optimize = "bernoulli_optimize"
    case samples = "bernoulli_samples"
    case pathfinder = "bernoulli_pathfinder"
    case stansummary = "bernoulli_stansummary"
  }
  
  public static func load<Content: Decodable>(_ type: Content.Type,
                                              basePath: String,
                                              model: String,
                                              filetype: String,
                                              from dataset: DataSet) -> [Content] {
    let decoder = CSVDecoder {
      $0.headerStrategy = .firstLine
    }
    
    let fileManager = FileManager.default
    let documentsUrl = fileManager.urls(for: .documentDirectory,
                                        in: .userDomainMask)[0] as NSURL
    let dirUrl = documentsUrl.appendingPathComponent(basePath + "/" + model)
    let modelPath: String = "\(dirUrl!.path)/\(model)"
    let filePath: String? = modelPath + "_" + filetype + ".csv"
    let csvUrl: URL
    
    if fileManager.fileExists(atPath: filePath!) {
      csvUrl = URL(fileURLWithPath: filePath!)
    } else {
      fatalError(
        """
        Could not find \(String(describing: filePath))
        Check it is available in the \(String(describing: filePath)).
        """
      )
    }
    
    guard
      let data = try? Data(contentsOf: csvUrl),
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
