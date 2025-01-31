import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (line[0],line[1])
var arr: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)

for i in 1...n {
    let l = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 1...m {
        arr[i][j] = l[j-1] + arr[i-1][j] + arr[i][j-1] - arr[i-1][j-1]
    }
}

var maxN = Int.min
for i in 1...n {
    for j in 1...m {
        for ii in 1...i {
            for jj in 1...j {
                let temp = arr[i][j] + arr[ii-1][jj-1] - arr[ii-1][j] - arr[i][jj-1]
                maxN = max(maxN, temp)
            }
        }
        maxN = max(maxN, arr[i][j])
    }
}
print(maxN)