import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let s = input[1]
let nums = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0
var right = 0
var sum = 0
var minLength = Int.max

while true {
    if sum >= s {
        minLength = min(minLength, right - left)
        sum -= nums[left]
        left += 1
    } else if right == n {
        break
    } else {
        sum += nums[right]
        right += 1
    }
}

print(minLength == Int.max ? 0 : minLength)