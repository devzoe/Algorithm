import Foundation

let n = Int(readLine()!)!
let mod = 1_000_000
let p = mod / 10 * 15
let m = n < p ? n : p

var arr: [Int] = [Int](repeating: 0, count: p)

arr[0] = 0
arr[1] = 1

for i in 2..<p {
    arr[i] = (arr[i-1] + arr[i-2]) % mod
}

print(arr[n % p])