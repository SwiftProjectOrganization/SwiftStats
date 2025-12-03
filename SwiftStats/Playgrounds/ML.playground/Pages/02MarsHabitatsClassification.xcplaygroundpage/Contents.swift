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

let classifier = try MLClassifier(trainingData: df,
                                  targetColumn: "purpose",
                                  featureColumns: ["solarPanels", "greenhouses", "size"])

let eval = classifier.evaluation(on: df)
let error = eval.classificationError
let accuracy = (1.0 - error) * 100

let homePath = FileManager.default.homeDirectoryForCurrentUser
let filepath = homePath.appendingPathComponent(".julia/dev/ISL/notebooks/ML models/classifier.mlmodel")
let classifierMetadata = MLModelMetadata(author: "Rob Goedman",
                                         shortDescription: "Constructs a classifier",
                                         version: "0.1")
try classifier.write(to: filepath, metadata: classifierMetadata)

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
