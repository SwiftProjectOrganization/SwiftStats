//
//  SampleResult.swift
//  SwiftStats
//
//  Created by Robert Goedman on 11/3/25.
//

public struct BernoulliSampleResult: Decodable {
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

public func runBernoulliSampleResult() -> ([Double], [Double]) {
  let results = DataLoader.load(
    BernoulliSampleResult.self,
    from: .bernoulli_samples
  )
  
  let lp: [Double] = results
    .map(\.lp__)
  
  let theta: [Double] = results
    .map(\.theta)
  
  return (lp, theta)
}
