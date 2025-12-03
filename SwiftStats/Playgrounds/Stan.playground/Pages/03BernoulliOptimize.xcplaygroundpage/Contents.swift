//: # SwiftStats: StatKit
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 03 Bernoulli Optimize types types

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
let csvUrl = dirUrl!.appendingPathComponent("bernoulli_optimize.csv")

let opt = try! DataFrame(contentsOfCSVFile: csvUrl)
print(opt.description(options: formattingOptions))

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
