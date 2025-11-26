//
//  SampleResult.swift
//  SwiftStats
//
//  Created by Robert Goedman on 11/3/25.
//

import Foundation

public struct StanBernoulliSamples: Decodable {
  public let lp__: Double
  public let theta: Double
  
  private enum CodingKeys: String, CodingKey {
    case lp__ = "lp__"
    case theta = "theta"
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder
      .container(keyedBy: CodingKeys.self)
    
    self.lp__ = try container
      .decode(Double.self, forKey: .lp__)
    
    self.theta = try container
      .decode(Double.self, forKey: .theta)
  }
}

public func readStanBernoulliSamples(basePath: String,
                                     model: String,
                                     filetype: String) -> ([Double], [Double]) {
  
  let results = StanBernoulliDataLoader.load(
    StanBernoulliSamples.self,
    basePath: basePath,
    model: model,
    filetype: filetype,
    from: .samples
  )
  
  let lp: [Double] = results
    .map(\.lp__)
  
  let theta: [Double] = results
    .map(\.theta)
  
  return (lp, theta)
}
