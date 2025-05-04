import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var set = Set(arr)
var temp = Array(set)
temp.sort()
var dict: [Int:Int] = [:]

for i in 0..<temp.count {
    dict[temp[i]] = i
}

for i in 0..<arr.count {
    arr[i] = dict[arr[i]]!
}

print(arr.map { String($0)}.joined(separator: " "))