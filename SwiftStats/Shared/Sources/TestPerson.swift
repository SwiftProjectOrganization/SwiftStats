public struct TestPerson: Decodable {
  public let name: String
  public let age: Int
  public let weight: Int
  public let state: String
  
  private enum CodingKeys: String, CodingKey {
    case name = "name"
    case age = "age"
    case weight = "weight"
    case state = "state"
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder
      .container(keyedBy: CodingKeys.self)
    
    self.name = try container
      .decode(String.self, forKey: .name)
    
    self.age = try container
      .decode(Int.self, forKey: .age)

    self.weight = try container
      .decode(Int.self, forKey: .weight)
    
    self.state = try container
      .decode(String.self, forKey: .state)
  }
}
