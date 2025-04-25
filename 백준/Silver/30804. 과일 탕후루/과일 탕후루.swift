import Foundation

let n = Int(readLine()!)!
let fruitNum = readLine()!.split(separator: " ").map { Int($0)! }
var left = 0
var fruitCount: [Int: Int] = [:]
var maxLen = 0

for right in 0..<n {
    let currentFruit = fruitNum[right]
    fruitCount[currentFruit, default: 0] += 1

    while fruitCount.count > 2 {
        let fruitToRemove = fruitNum[left]
        fruitCount[fruitToRemove]! -= 1
        if fruitCount[fruitToRemove]! == 0 {
            fruitCount.removeValue(forKey: fruitToRemove)
        }
        left += 1
    }

    maxLen = max(maxLen, right - left + 1)
}

print(maxLen)