import Foundation
import CodableCSV

public enum DataLoader {
  
  public enum DataSet: String {
    case testpeople = "testpeople"
  }
  
  public static func load<Content: Decodable>(_ type: Content.Type, from dataset: DataSet) -> [Content] {
    let decoder = CSVDecoder {
      $0.headerStrategy = .firstLine
    }
    
    guard
      let bundle = Bundle(identifier: "com.goedman.SwiftStats"),
      let csvURL = bundle.url(forResource: dataset.rawValue, withExtension: "csv")
    else {
      fatalError(
        """
        Could not find \(dataset.rawValue).csv!
        Check it is available in the Data folder.
        """
      )
    }
    guard
      let data = try? Data(contentsOf: csvURL),
      let content = try? decoder.decode([Content].self, from: data)
    else {
      fatalError(
        """
        Decoding error!
        """
      )
    }
    
    return content
  }
}
