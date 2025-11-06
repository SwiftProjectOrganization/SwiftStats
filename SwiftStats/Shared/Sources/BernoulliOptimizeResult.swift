public struct BernoulliOptimizeResult: Decodable {
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

public func runBernoulliOptimizeResult() -> ([Double], [Double]) {
  let results = DataLoader.load(
    BernoulliOptimizeResult.self,
    from: .bernoulli_optimize
  )
  
  let lp: [Double] = results
    .map(\.lp__)
  
  let theta: [Double] = results
    .map(\.theta)
  
  return (lp, theta)
}
