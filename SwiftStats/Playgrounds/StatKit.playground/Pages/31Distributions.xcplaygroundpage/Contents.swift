//: # SwiftStats
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 31 Distributions
import Foundation
import StatKit
import SwiftUI
import PlaygroundSupport
import Charts

struct SalesData: Identifiable {
    let id = UUID()
    let month: String
    let sales: Int
}

let salesData = [
    SalesData(month: "Jan", sales: 200),
    SalesData(month: "Feb", sales: 150),
    SalesData(month: "Mar", sales: 180),
    SalesData(month: "Apr", sales: 900),
    SalesData(month: "May", sales: 1050),
    SalesData(month: "Jun", sales: 3600),
    SalesData(month: "Jul", sales: 4900),
    SalesData(month: "Aug", sales: 5120),
    SalesData(month: "Sep", sales: 3500),
    SalesData(month: "Oct", sales: 2700),
    SalesData(month: "Nov", sales: 1050),
    SalesData(month: "Dec", sales: 80),
]

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, charts world!")
            Chart {
                ForEach(salesData) { data in
                    BarMark(
                        x: .value("Month", data.month),
                        y: .value("Sales", data.sales)
                    )
                }
            }
            .frame(width: 400, height: 200)
            .padding()
            Chart {
                ForEach(salesData) { data in
                    LineMark(
                        x: .value("Month", data.month),
                        y: .value("Sales", data.sales)
                    )
                }
            }
            .frame(height: 200)
            .padding()
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())



let normal = NormalDistribution(mean: 0, variance: 1)
normal.cdf(x: 0)

// Generates 10 samples from the normal distribution
let normalRandomVariable = normal.sample(10)

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
