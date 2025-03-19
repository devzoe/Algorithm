import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0
while true {
    let temp = arr.sorted()
    if temp == arr { break }
    else {
        for i in 1..<arr.count {
            if arr[i-1] > arr[i] {
                result += 1
                arr[i] *= 2
            }
        }
    }
}

print(result)