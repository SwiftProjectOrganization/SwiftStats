//: # SwiftStats: StatKit
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 01 Bernoulli sample types types

import SwiftUI
import PlaygroundSupport
import Charts
import CodableCSV
import StatKit

let basePath = "Stan"
let model = "bernoulli"

var lp: [Double] = []
var theta: [Double] = []
(lp, theta) = readStanBernoulliSamples(
  basePath: basePath,
  model: model,
  filetype: "samples")

theta.median(variable: \.self)
theta.mean(variable: \.self, strategy: .arithmetic)
theta.standardDeviation(variable: \.self, from: .sample)

lp.mean(variable: \.self, strategy: .arithmetic)
lp.standardDeviation(variable: \.self, from: .sample)

// Use a named tuple
let res = (lp: lp, theta: theta)
res.theta

// Plot the chains
struct ChainElement: Identifiable {
  let id = UUID()
  let y: Double
  let index: Int
  
  init(y: Double, index: Int) {
    self.y = y
    self.index = index
  }
}

var chain_1: [ChainElement] = []
for i in 0...999 {
  chain_1.append(ChainElement(y: theta[i], index: i))
}
var chain_2: [ChainElement] = []
for i in 1000...1999 {
  chain_2.append(ChainElement(
    y: theta[i], index: i - 1000))
}
var chain_3: [ChainElement] = []
for i in 2000...2999 {
  chain_3.append(ChainElement(
    y: theta[i], index: i - 2000))
}
var chain_4: [ChainElement] = []
for i in 3000...3999 {
  chain_4.append(ChainElement(
    y: theta[i], index: i - 3000))
}

struct ContentView: View {
  var body: some View {
    VStack {
      Chart {
        ForEach(chain_1) { data in
          LineMark(
            x: .value("Obs", data.index),
            y: .value("Value", data.y)
          )
        }
      }
      .chartYAxisLabel("Chain 1")
      .foregroundStyle(Color.blue)
      .frame(width: 400)
      .frame(height: 200)
      .padding()
       Chart {
        ForEach(chain_2) { data in
          LineMark(
            x: .value("Obs", data.index),
            y: .value("Value", data.y)
          )
        }
      }
      .chartYAxisLabel("Chain 2")
      .foregroundStyle(Color.red)
      .frame(width: 400)
      .frame(height: 200)
      .padding()
      Chart {
        ForEach(chain_3) { data in
          LineMark(
            x: .value("Obs", data.index),
            y: .value("Value", data.y)
          )
        }
      }
      .chartYAxisLabel("Chain 3")
      .foregroundStyle(Color.green)
      .frame(width: 400)
      .frame(height: 200)
      .padding()
      Chart {
        ForEach(chain_4) { data in
          LineMark(
            x: .value("Obs", data.index),
            y: .value("Value", data.y)
          )
        }
      }
      .chartYAxisLabel("Chain 4")
      .foregroundStyle(Color.yellow)
      .frame(width: 400)
      .frame(height: 200)
      .padding()
    }
  }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
