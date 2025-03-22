let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0],nk[1])

var arr: [Int] = []
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
var l = 1
var r = arr.max()!
var result = Int.min
while l <= r {
    let mid = (l+r)/2
    var m = 0
    for num in arr {
        m += num/mid
    }
    if m < k {
        r = mid - 1
    } else {
        l = mid + 1
        result = max(result,mid)
    }
}
print(result)