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
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
