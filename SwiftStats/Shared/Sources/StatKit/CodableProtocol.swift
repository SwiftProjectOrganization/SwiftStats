import Foundation
import CodableCSV

public enum CodableProtocol {
  static func run() -> String {
    let decoder = CSVDecoder { config in
      config.headerStrategy = .firstLine
    }
    
    guard
      let csvURL = Bundle(identifier: "com.goedman.SwiftStats")?
        .url(forResource: "testpeople", withExtension: "csv"),
      let peopleData = try? Data(contentsOf: csvURL),
      let people = try? decoder
        .decode([TestPerson].self, from: peopleData)
    else {
      fatalError(
        """
        Could not find testpeople.csv.
        Check that it is available in the Statistical Swift Shared Data folder.
        """
      )
    }
    
    let names = people
      .map(\.name)
      .joined(separator: " and ")

    return names
  }
}

