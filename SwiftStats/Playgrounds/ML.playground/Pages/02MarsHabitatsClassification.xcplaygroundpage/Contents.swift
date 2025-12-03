//: # SwiftStats: ML
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 02 MarsHabitats classification example

/*:
 # Train a Classifier
 */
import Foundation
import TabularData
import CreateML

let fileManager = FileManager.default
let documentsUrl = fileManager.urls(for: .documentDirectory,
                                    in: .userDomainMask)[0] as NSURL
let dirUrl = documentsUrl.appendingPathComponent("ML/MarsHabitats")
let csvUrl = dirUrl!.appendingPathComponent("/MarsHabitats.csv")

let df = try! DataFrame(contentsOfCSVFile: csvUrl)

let (evalDf, trainingDf) = df.randomSplit(by: 0.2, seed: 12313)
print(evalDf)

let classifier = try MLClassifier(
  trainingData: DataFrame(trainingDf),
  targetColumn: "purpose",
  featureColumns: ["solarPanels", "greenhouses", "size"])
print(classifier)

let eval = classifier.evaluation(on: DataFrame(evalDf))
let error = eval.classificationError
print(eval)
let accuracy = (1.0 - error) * 100

let classifierMetadata = MLModelMetadata(
  author: "Rob Goedman",
  shortDescription: "Predicts the purpose of a habitat on Mars.",
  version: "1.0")

try classifier.write(to: dirUrl!.appendingPathComponent("MarsHabitatClassifier.mlmodel"),
                    metadata: classifierMetadata)

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
