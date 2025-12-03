//: [Previous](@previous)

import Foundation
import TabularData
import PlaygroundSupport

let formattingOptions = FormattingOptions(maximumLineWidth: 100,
                                          maximumCellWidth: 20,
                                          maximumRowCount: 10)

let fileManager = FileManager.default
let documentsUrl = fileManager.urls(for: .documentDirectory,
                                    in: .userDomainMask)[0] as NSURL
let dirUrl = documentsUrl.appendingPathComponent("Stan/bernoulli")
let csvUrl = dirUrl!.appendingPathComponent("bernoulli_pathfinder.csv")

let pathfinder = try! DataFrame(contentsOfCSVFile: csvUrl)
print(pathfinder.description(options: formattingOptions))

//: [Next](@next)
