let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var sum = arr[0]
var result: [Int] = [arr[0]]

for i in 1..<N {
    let value = arr[i] * (i+1) - sum
    sum += value
    result.append(value)
}
result.forEach { print($0, terminator: " ")}