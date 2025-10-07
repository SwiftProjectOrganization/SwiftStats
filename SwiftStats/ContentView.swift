//
//  ContentView.swift
//  SwiftStats
//
//  Created by Robert Goedman on 10/6/25.
//

import SwiftUI
import StatKit
import CodableCSV
import Charts

struct ContentView {
  @State private var rolls = ""
  @State private var names: String = ""
  @State private var names2: String = ""
  @State private var ages: String = ""
  @State private var totalAge: String = ""
}

extension ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
      Spacer()
      Chart {
          LinePlot(x: "x", y: "y = sin(x)") { sin($0) }
              .foregroundStyle(by: .value("expression", "y=sin(x)"))
              .lineStyle(StrokeStyle(lineWidth: 5, lineCap: .round))
              .opacity(0.8)
        LinePlot(x: "x", y: "y = cos(x)") { 0.2 * $0 + 3 * cos($0) }
              .foregroundStyle(by: .value("expression", "y=cos(x)"))
              .lineStyle(StrokeStyle(lineWidth: 5, lineCap: .round))
              .opacity(0.8)
      }
      .chartXScale(domain: -10 ... 10)
      .chartYScale(domain: -10 ... 10)
      
      Spacer()
      Button("Show rolls") {
        rolls = RandomVariables.run()
        (names, ages, totalAge) = runNamesAndAges()
        names2 = CodableProtocol.run()
      }
      Spacer()
      Text(rolls)
      Text(names)
      Text(ages)
      Text(totalAge)
      Text(names2)
    }
    .padding()
  }
}

extension ContentView {
  func runNamesAndAges() -> (String, String, String) {
    //var names: String = ""
    let people = DataLoader.load(
      TestPerson.self,
      from: .testpeople
    )
    
    let names = people
      .map(\.name)
      .joined(separator: " and ")
    
    let ages = people
      .map(\.age)
      .map(String.init)
      .joined(separator: " and ")
    
    let totalAge = people
      .sum(over: \.age)

    return ("Names: \(names)", "Ages: \(ages)", "Total Age: \(totalAge)")
  }
}

#Preview {
  ContentView()
}
