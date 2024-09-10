func combinations(_ array: [Int], _ k: Int) -> [[Int]] {
    var result: [[Int]] = []
    func backtrack(_ start: Int, _ ans: inout [Int]) {
        if ans.count == k {
            result.append(ans)
            return
        }
        for i in start..<array.count {
            ans.append(array[i])
            backtrack(i+1, &ans)
            ans.removeLast()
        }
    }
    var ans: [Int] = []
    backtrack(0, &ans)
    return result
}

func main() {
    var arr: [Int] = []
    for _ in 0..<9 {
        arr.append(Int(readLine()!)!)
    }
    let combination = combinations(arr, 2)
    for c in combination {
        let a = arr.filter{ !c.contains($0) }
        let sum = a.reduce(0, +)
        if sum == 100 {
            a.sorted().forEach { print($0)}
            break
        }
    }
}

main()