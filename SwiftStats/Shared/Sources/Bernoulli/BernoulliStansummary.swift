//
//  SampleResult.swift
//  SwiftStats
//
//  Created by Robert Goedman on 11/3/25.
//

import Foundation

public struct BernoulliStanSummary: Decodable {
  public let varName: String
  public let varMean: Double
  public let varMcse: Double?
  public let varStd: Double
  public let varMad: Double
  public let varProc5: Double?
  public let varProc50: Double?
  public let varProc95: Double?
  public let varEss_bulk: Double?
  public let varEss_tail: Double?
  public let varEss_bulk_per_s: Double?
  public let varRhat: Double?

  private enum CodingKeys: String, CodingKey {
    case varName = "name"
    case varMean = "mean"
    case varMcse = "mcse"
    case varStd = "stddev"
    case varMad = "mad"
    case varProc5 = "p05"
    case varProc50 = "p50"
    case varProc95 = "p95"
    case varEss_bulk = "ess_bulk"
    case varEss_tail = "ess_tail"
    case varEss_bulk_per_s = "ess_bulk_per_s"
    case varRhat = "R_hat"
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder
      .container(keyedBy: CodingKeys.self)
    
    self.varName = try container
      .decode(String.self, forKey: .varName)
    
    self.varMean = try container
      .decode(Double.self, forKey: .varMean)
    
    self.varMcse = try container
      .decode(Double.self, forKey: .varMcse)
       
    self.varStd = try container
      .decode(Double.self, forKey: .varStd)
    
    self.varMad = try container
      .decode(Double.self, forKey: .varMad)
   
    self.varProc5 = try container
      .decode(Double.self, forKey: .varProc5)
   
    self.varProc50 = try container
      .decode(Double.self, forKey: .varProc50)
   
    self.varProc95 = try container
      .decode(Double.self, forKey: .varProc95)
   
    self.varEss_bulk = try container
      .decode(Double.self, forKey: .varEss_bulk)
   
    self.varEss_tail = try container
      .decode(Double.self, forKey: .varEss_tail)
   
    self.varEss_bulk_per_s = try container
      .decode(Double.self, forKey: .varEss_bulk_per_s)
   
    self.varRhat = try container
      .decode(Double.self, forKey: .varRhat)
    
  }
}

public func readBernoulliStanSummary(basePath: String,
                                     model: String,
                                     filetype: String = "stansummary") -> Dictionary<String, (mean: Double, mcse: Double?, std: Double, mad: Double, p05: Double?, p50: Double?, p95: Double?, ess_bulk: Double?, ess_tail: Double?, ess_bulk_per_s: Double?, rhat: Double?)> {
  let results = StanBernoulliDataLoader.load(
    BernoulliStanSummary.self,
    basePath: basePath,
    model: model,
    filetype: "stansummary",
    from: .stansummary
  )

  let varNames: [String] = results
    .map(\.varName)
  
  let varMeans: [Double] = results
    .map(\.varMean)
  
  var varMcses: [Double?] = results
    .map(\.varMcse)
  for i in 0..<varMcses.count {
    if varMcses[i] == -100000 {
      varMcses[i] = nil
    }
  }
  
  let varStds: [Double] = results
    .map(\.varStd)
  
  let varMads: [Double] = results
    .map(\.varMad)
  
  var varProc5s: [Double?] = results
    .map(\.varProc5)
  for i in 0..<varProc5s.count {
    if varProc5s[i] == -100000.0 {
      varProc5s[i] = nil
    }
  }

  var varProc50s: [Double?] = results
    .map(\.varProc50)
  for i in 0..<varProc50s.count {
    if varProc50s[i] == -100000.0 {
      varProc50s[i] = nil
    }
  }

  var varProc95s: [Double?] = results
    .map(\.varProc95)
  for i in 0..<varProc95s.count {
    if varProc95s[i] == -100000.0 {
      varProc95s[i] = nil
    }
  }

  var varEss_bulks: [Double?] = results
    .map(\.varEss_bulk)
  for i in 0..<varEss_bulks.count {
    if varEss_bulks[i] == -100000.0 {
      varEss_bulks[i] = nil
    }
  }

  var varEss_tails: [Double?] = results
    .map(\.varEss_tail)
  for i in 0..<varEss_tails.count {
    if varEss_tails[i] == -100000.0 {
      varEss_tails[i] = nil
    }
  }

  var varEss_bulk_per_ss: [Double?] = results
    .map(\.varEss_bulk_per_s)
  for i in 0..<varEss_bulk_per_ss.count {
    if varEss_bulk_per_ss[i] == -100000 {
      varEss_bulk_per_ss[i] = nil
    }
  }

  var varRhats: [Double?] = results
    .map(\.varRhat)
  for i in 0..<varRhats.count {
    if varRhats[i] == -100000.0 {
      varRhats[i] = nil
    }
  }

  var dict : [String : (mean: Double, mcse: Double?, std: Double, mad: Double, p05: Double?, p50: Double?, p95: Double?, ess_bulk: Double?, ess_tail: Double?, ess_bulk_per_s: Double?, rhat: Double?)] = [:]

  for index in 0...varNames.count-1 {
    dict[varNames[index]] = (mean: varMeans[index], mcse: varMcses[index], std: varStds[index], mad: varMads[index], p05: varProc5s[index], p50: varProc50s[index], p95: varProc95s[index], ess_bulk: varEss_bulks[index], ess_tail: varEss_tails[index], ess_bulk_per_s: varEss_bulk_per_ss[index], rhat: varRhats[index])
  }
          
 return dict
}
