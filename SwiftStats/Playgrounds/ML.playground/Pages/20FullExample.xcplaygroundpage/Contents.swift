//: # SwiftStats: ML
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 04 Full MLCreate example (using DataTables)


import Foundation
import TabularData

let nameColumn = Column(ColumnID("name", String.self), contents: ["Bob", "Alice"])
let idColumn = Column(ColumnID("id", UUID.self), contents: [UUID(), UUID()])
let doubleColumn = Column(ColumnID("doubles", Double.self), contents: [1.3, 2.4])
let intColumn = Column(ColumnID("ints", Int.self), contents: [1, 3])

var frame = DataFrame()
frame.append(column: nameColumn)
frame.append(column: idColumn)
frame.append(column: doubleColumn)
frame.append(column: intColumn)
print(frame)

// DataFrame to dict, this way assigns the column object
var dict: [String: Any] = [:]
for name in frame.columns.map({ $0.name }) {
  dict[name] = frame[name]
}
print(dict["ints"]!)
print(type(of: dict["ints"]!))
print("\n")

// DataFrame to dict, this way assigns the values
var dict1: [String: [Any]] = [:]
for column in frame.columns {
  dict1[column.name] = frame[column.name].map { $0! }
}
print(dict1)
print(dict1["ints"]!)
print("\n")

// Convert and multiply
let fd = frame.doubles[0]! as! Double
let fi = frame.ints[1]! as! Int
print(fd * Double(fi))
print("\n")

var ds: [Double] = []
for d in frame.ints {
  ds.append(Double(d! as! Int))
}

// Previously assigned column "ints" now replaced by Doble values
dict["ints"] = ds
print(dict["ints"]!)

// Using literals to create DataFrames
let df1: DataFrame = [
  "a": [1, 2, 3, 5],
  "b": [1.414, 2.718, 3.14, 6.28]
]
print(df1)

let data = [
    "Name": ["Alice", "Bob", "Charlie"],
    "Age": [25, 30, 35],
    "City": ["New York", "Los Angeles", ]
]

let df2: DataFrame = [
  "Name": ["Alice", "Bob", "Charlie"],
  "Age": [25, 30, 35],
  "City": ["New York", "Los Angeles", ]
]
print(df2)

let df3: DataFrame = [
  "a": [1, 2, 3, 5],
  "b": [1.414, nil, 3.14, 6.28],
  "c": ["Hello", "World", "Swift"],
  "d": [(1, 3), [4, 5], (a:7, b:9), (10, 11)]
]
print(df3)

let a: [Int] = []
print(df3["a"])
var avs: [Double] = []
for a in df3.a {
  avs.append(Double(a! as! Int))
}
avs
print(df3.a)
let values = df3.selecting(columnNames: ["a", "b"])
print(values)

let val = df3["b", Double.self][0...2]
print(val)

let nt = df3["d"][2] as! (a: Int, b: Int)
print(nt.a)
type(of: nt)

print(type(of: df3["b"]))

//let df4: DataFrame = dict1
//print(df4)

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
