import Foundation

let n = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(line)
}

var result: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

func dfs(_ parent: Int, _ curr: Int, _ visited: inout [Bool]) {
    visited[curr] = true
    for (i,item) in arr[curr].enumerated() {
        if item == 1 {
            result[parent][i] = 1
            if !visited[i] {
                visited[i] = true
                dfs(parent, i, &visited)
            }
        }
    }
}

for i in 0..<n {
    var visited: [Bool] = [Bool](repeating: false, count: n)
    dfs(i, i, &visited)
}

result.forEach {
    $0.forEach { print($0, terminator: " ")}
    print()
}