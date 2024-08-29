import Foundation

func readInput() -> (Int, Int, [[Int]]) {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let N = line[0]
    let M = line[1]
    var arr: [[Int]] = [[Int]](repeating: [], count: N)
    for _ in 0..<M {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        arr[line[0]].append(line[1])
        arr[line[1]].append(line[0])
    }
    return (N, M, arr)
}

func dfs(current: Int, arr: [[Int]], visited: inout [Bool], count: inout Int, answer: inout Int) {
    visited[current] = true
    count += 1
    if count == 5 {
        answer = 1
        return
    }
    for next in arr[current] {
        if !visited[next] {
            dfs(current: next, arr: arr, visited: &visited, count: &count, answer: &answer)
            count -= 1
        }
   }
    visited[current] = false
}

let (N, M, arr) = readInput()
var answer = 0
for i in 0..<N {
    var count = 0
    var visited: [Bool] = [Bool](repeating: false, count: N)
    dfs(current: i, arr: arr, visited: &visited, count: &count, answer: &answer)
    if answer != 0 {
        break
    }
}
print(answer)