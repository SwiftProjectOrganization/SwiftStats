//: # SwiftStats: ML
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 01 MarsHabitats regression example

import Foundation
import CreateML
import TabularData

let fileManager = FileManager.default
let documentsUrl = fileManager.urls(for: .documentDirectory,
                                    in: .userDomainMask)[0] as NSURL
let dirUrl = documentsUrl.appendingPathComponent("ML/MarsHabitats")
let csvUrl = dirUrl!.appendingPathComponent("MarsHabitats.csv")

let df = try! DataFrame(contentsOfCSVFile: csvUrl)
print(df)

let regressorColumns = ["price", "solarPanels", "greenhouses", "size"]

var df2 = df
df2.removeColumn("purpose")
let (evalDf, trainDf) = df.randomSplit(by: 0.20, seed: 5)
var eDf = DataFrame(evalDf)
let tDf = DataFrame(trainDf)

let regressor = try MLLinearRegressor(
  trainingData: tDf,
  targetColumn: "price",
  featureColumns: ["solarPanels", "greenhouses", "size"])

let regressorEvaluation = regressor.evaluation(on: eDf)

var preds: [Double] = []
var act: [Int] = []
do {
  let predictions = try regressor.predictions(from: eDf)
  for i in 0...predictions.count - 1 {
    preds.append(predictions[i] as! Double)
    act.append(eDf.rows[i]["price"] as! Int)
  }
} catch {
  print(error.localizedDescription)
}

var dataFrame = DataFrame()
let idColumn = Column(name: "pred", contents: preds)
let idColumn1 = Column(name: "act", contents: act)
dataFrame.append(column: idColumn)
dataFrame.append(column: idColumn1)

var delta: [Double] = []
for i in 0...preds.count - 1 {
  delta.append((dataFrame.rows[i]["pred"] as! Double) - Double((dataFrame.rows[i]["act"] as! Int)))
}

let idColumn2 = Column(name: "delta", contents: delta)
dataFrame.append(column: idColumn2)
print(dataFrame)


let regressorMetadata = MLModelMetadata(
  author: "Rob Goedman",
  shortDescription: "Predicts the price of a habitat on Mars.",
  version: "1.0")

try regressor.write(to: dirUrl!.appendingPathComponent("MarsHabitatPricer.mlmodel"),
                    metadata: regressorMetadata)

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
