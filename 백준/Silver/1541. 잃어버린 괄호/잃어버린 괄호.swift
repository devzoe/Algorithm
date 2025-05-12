import Foundation

let input = readLine()!
let parts = input.split(separator: "-")

var temp: [Int] = []

for part in parts {
    let sum = part.split(separator: "+").map { Int($0)! }.reduce(0, +)
    temp.append(sum)
}

var result = temp[0]
for i in temp.dropFirst() {
    result -= i
}

print(result)