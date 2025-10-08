//: [Previous](@previous)

@MainActor
func runNamesAndAges() -> (String, String, String) {
  //var names: String = ""
  let people = DataLoader.load(
    TestPerson.self,
    from: .testpeople
  )
  
  let names = people
    .map(\.name)
    .joined(separator: " and ")
  
  let ages = people
    .map(\.age)
    .map(String.init)
    .joined(separator: " and ")
  
  let totalAge = people
    .sum(over: \.age)

  return ("Names: \(names)", "Ages: \(ages)", "Total Age: \(totalAge)")
}

var names: String = ""
var ages: String = ""
var totalAge: String = ""
(names, ages, totalAge) = runNamesAndAges()


//: [Next](@next)
