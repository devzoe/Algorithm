import Foundation

let n = Int(readLine()!)!
var arrA = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
var arrB = readLine()!.split(separator: " ").map { Int($0)! }
var commonElements = Set(arrA).intersection(Set(arrB))

if commonElements.isEmpty {
    print(0)
    exit(0)
}

var result: [Int] = []

while !commonElements.isEmpty {
    let maxVal = commonElements.max()!
    result.append(maxVal)

    if let idx1 = arrA.firstIndex(of: maxVal), let idx2 = arrB.firstIndex(of: maxVal) {
        arrA = Array(arrA.dropFirst(idx1 + 1))
        arrB = Array(arrB.dropFirst(idx2 + 1))
    } else {
        break
    }

    commonElements = Set(arrA).intersection(Set(arrB))
}

print(result.count)
print(result.map { String($0) }.joined(separator: " "))