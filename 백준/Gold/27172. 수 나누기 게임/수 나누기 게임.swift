import Foundation

let n = Int(readLine()!)!
let x = readLine()!.split(separator: " ").map { Int($0)! }
let maxValue = x.max()!
var sieve = [Int](repeating: 0, count: maxValue + 1)
let xSet = Set(x)

for i in x {
    if i == maxValue { continue }
    var multiple = 2 * i
    while multiple <= maxValue {
        if xSet.contains(multiple) {
            sieve[i] += 1
            sieve[multiple] -= 1
        }
        multiple += i
    }
}

let result = x.map { String(sieve[$0]) }.joined(separator: " ")
print(result)
