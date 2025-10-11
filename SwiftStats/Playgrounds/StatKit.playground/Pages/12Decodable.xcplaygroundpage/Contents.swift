//: # SwiftStats: StatKit
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 12 Decodable protocol
import Foundation
import CodableCSV

struct Person: Decodable {
  let name: String
  let age: Int
  enum CodingKeys: String, CodingKey {
    case name = "name"
    case age = "age"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder
      .container(keyedBy: CodingKeys.self)
    self.name = try container
      .decode(String.self, forKey: .name)
    self.age = try container
     .decode(Int.self, forKey: .age)
  }
}

let decoder = CSVDecoder { config in
  config.headerStrategy = .firstLine
}

let testURL = URL(filePath: "~")
let csvFile2 = URL(fileURLWithPath: "~/Projects/Swift/Apps/SwiftStats/SwiftStats/Shared/Data/testpeople.csv")

let csvFile = Bundle(identifier: "com.goedman.SwiftStats")?
  .url(forResource: "testpeople", withExtension: "csv")

do {
  let people = try decoder
    .decode([Person].self, from: csvFile!)
  for person in people {
    print(person)
  }
} catch {
  print(error.localizedDescription)
}

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)

