import Foundation

func combination(_ n: Int, _ k: Int) -> [[Int] ]{
    var result: [[Int]] = []
    var arr: [Int] = [Int](repeating: 0, count: n)
    for i in 0..<n { arr[i] = i}
    func backtrack(_ curr: Int, _ ans: inout [Int]) {
        if ans.count == k {
            result.append(ans)
            return
        }
        for i in curr..<n {
            ans.append(i)
            backtrack(i+1, &ans)
            ans.removeLast()
        }
    }
    var ans: [Int] = []
    backtrack(0, &ans)
    return result
}

func main() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    var map: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var chicken: [(Int,Int)] = []
    var home: [(Int,Int)] = []
    for i in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        for j in 0..<n {
            map[i][j] = line[j]
            if line[j] == 2 {
                chicken.append((i,j))
            } else if line[j] == 1 {
                home.append((i,j))
            }
        }
    }
    let comb = combination(chicken.count, m)
    var result = Int.max
    for c in comb {
        var sum = 0
        for h in home {
            var minL = Int.max
            for i in c {
                let l = abs(h.0 - chicken[i].0) + abs(h.1 - chicken[i].1)
                minL = min(l, minL)
            }
            sum += minL
        }
        result = min(result, sum)
    }
    print(result)
}
main()