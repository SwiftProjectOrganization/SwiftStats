//: # SwiftStats: StatKit
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 11 KeyPath types
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


let people = DataLoader.load(
  Person.self,
  from: .testpeople
)

let partialkeys: [PartialKeyPath<Person>] = [
  \Person.name,
  \Person.age
]

for _ in 1 ... 5 {
  guard
    let randomKey = partialkeys.randomElement(),
    let person = people.randomElement()
  else { continue }
  let value = person[keyPath: randomKey]
  print(value)}

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
