import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var even: [Int] = [Int](repeating: 0, count: n/2+1)
var odd: [Int] = [Int](repeating: 0, count: n/2+1)
even[1] = arr[0]
odd[1] = arr[1]
for i in 1..<n/2 {
    even[i+1] = even[i] + arr[i*2]
    odd[i+1] = odd[i] + arr[i*2+1]
}
var ans = even[n/2]
var sum = even[n/2] + odd[n/2]
for i in 1...n/2 {
    ans = max(ans, even[i-1]+odd[n/2]-odd[i-1])
    ans = max(ans, sum-arr[n-1]-odd[i-1]-even[n/2]+even[i])
}
print(ans)