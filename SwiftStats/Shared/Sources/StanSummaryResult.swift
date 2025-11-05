//
//  SampleResult.swift
//  SwiftStats
//
//  Created by Robert Goedman on 11/3/25.
//

import Foundation

public struct StanSummaryResult: Decodable {
  public let varName: String
  public let varMean: Double
//  public let varMCSE: Double
  public let varStd: Double
//  public let varMAD: Double
//  public let varRhat: Double

  private enum CodingKeys: String, CodingKey {
    case varName = "name"
    case varMean = "Mean"
//    case varMCSE = "MCSE"
    case varStd = "StdDev"
//    case varMAD = "MAD"
//    case varRhat = "R_hat"
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder
      .container(keyedBy: CodingKeys.self)
    
    self.varName = try container
      .decode(String.self, forKey: .varName)
    
    self.varMean = try container
      .decode(Double.self, forKey: .varMean)
    
//    self.varMCSE = try container
//      .decode(Double.self, forKey: .varMCSE)
       
    self.varStd = try container
      .decode(Double.self, forKey: .varStd)
    
//    self.varMAD = try container
//      .decode(Double.self, forKey: .varMAD)
   
//    self.varRhat = try container
//      .decode(Double.self, forKey: .varRhat)
    
  }
}

public func runStanSummaryResult() -> Dictionary<String, (mean: Double, std: Double)> {
  let results = DataLoader.load(
    StanSummaryResult.self,
    from: .bernoulli_stansummary
  )
  
  let varNames: [String] = results
    .map(\.varName)
  
  let varMeans: [Double] = results
    .map(\.varMean)
  
//  let varMCSEs: [Double] = results
//    .map(\.varMCSE)
    
  let varStds: [Double] = results
    .map(\.varStd)
  
//  let varMADs: [Double] = results
//    .map(\.varMAD)
  
//  let varRhats: [Double] = results
//    .map(\.varRhat)
  
  var dict : [String: (mean: Double, std: Double)] = [:]

  for index in 0...varNames.count-1 {
    dict[varNames[index]] = (mean: varMeans[index], std: varStds[index])
  }
          
 return dict
}
