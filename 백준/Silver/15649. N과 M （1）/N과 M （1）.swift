func permutations<T>(_ array: [T], _ k: Int) -> [[T]] {
    var result: [[T]] = []

    func backtracking(_ ans: inout [T], _ visited: inout [Bool]) {
        if ans.count == k {
            result.append(ans)
            return
        }

        for i in 0..<array.count {
            if visited[i] {
                continue
            }

            visited[i] = true
            ans.append(array[i])
            backtracking(&ans, &visited)
            ans.removeLast()
            visited[i] = false
        }
    }

    var ans: [T] = []
    var visited = Array(repeating: false, count: array.count)
    backtracking(&ans, &visited)
    return result
}

func readInput() -> (Int, [Int]) {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let N = line[0]
    let M = line[1]
    var arr = [Int]()
    for i in 1...N {
        arr.append(i)
    }
    return (M, arr)
}

let (M, arr) = readInput()
let result = permutations(arr, M)
for r in result {
    print(r.map { String($0) }.joined(separator: " "))
}
