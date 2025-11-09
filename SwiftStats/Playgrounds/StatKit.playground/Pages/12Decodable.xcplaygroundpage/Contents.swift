//: # SwiftStats: StatKit
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 12 Decodable protocol
import Foundation
import CodableCSV

let decoder = CSVDecoder { config in
  config.headerStrategy = .firstLine
}

let testURL = URL(filePath: "~")
let csvFile2 = URL(fileURLWithPath: "~/Projects/Swift/Apps/SwiftStats/SwiftStats/Shared/Data/testpeople.csv")

let csvFile = Bundle(identifier: "com.goedman.SwiftStats")?
  .url(forResource: "testpeople", withExtension: "csv")

do {
  let people = try decoder
    .decode([TestPerson].self, from: csvFile!)
  for person in people {
    print(person)
  }
} catch {
  print(error.localizedDescription)
}

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)

