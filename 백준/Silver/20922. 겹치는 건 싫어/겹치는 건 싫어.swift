let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (line[0],line[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var dict: [Int:Int] = [:]
var start = 0
var end = 0
var maxDist = Int.min
while end < n && start <= end {
    dict[arr[end], default: 0] += 1
    if dict[arr[end]]! > k {
        dict[arr[start], default: 0] -= 1
        dict[arr[end], default: 0] -= 1
        start += 1
    } else {
        maxDist = max(maxDist, end-start+1)
        end += 1
    }
}
print(maxDist)