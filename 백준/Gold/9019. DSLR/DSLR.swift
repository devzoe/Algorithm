import Foundation

func DSLR(_ op: String, _ n: Int) -> Int {
    switch op {
    case "D":
        return 2 * n % 10000
    case "S":
        return (n + 9999) % 10000
    case "L":
        return n % 1000 * 10 + n / 1000
    case "R":
        return n / 10 + n % 10 * 1000
    default:
        break
    }
    return 0
}

func bfs(_ a: Int, _ b: Int) -> String {
    let operators = ["D", "S", "L", "R"]
    var result = ""
    var queue: [(Int, String)] = [(a,"")]
    var visited: [Bool] = [Bool](repeating: false, count: 10000)
    var idx = 0
    visited[a] = true
    loop: while idx < queue.count {
        let (currentNum, opResult) = queue[idx]
        for op in operators {
            if currentNum == 0 && op != "S" { continue }
            let newNum = DSLR(op, currentNum)
            if newNum == b {
                result = opResult + op
                break loop
            }
            if !visited[newNum] {
                visited[newNum] = true
                queue.append((newNum,opResult+op))
            }
        }
        idx += 1
    }
    return result
}

func main() {
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let ab = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b) = (ab[0],ab[1])
        if a == b {
            print("")
            continue
        }
        print(bfs(a, b))
    }
}

main()