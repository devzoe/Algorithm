import Foundation

func main() {
    let n = Int(readLine()!)!
    let num = readLine()!.split(separator: " ").map { Int($0)! }
    var op = readLine()!.split(separator: " ").map { Int($0)! }
    var maxN = Int.min
    var minN = Int.max
    
    func dfs(answer: Int, d: Int) {
        if d == n {
            maxN = max(maxN, answer)
            minN = min(minN, answer)
            return
        }
        
        for i in 0..<4 {
            if op[i] < 1 {
                continue
            }
            op[i] -= 1
            switch i {
            case 0:
                dfs(answer: answer + num[d], d: d + 1)
            case 1:
                dfs(answer: answer - num[d], d: d + 1)
            case 2:
                dfs(answer: answer * num[d], d: d + 1)
            case 3:
                dfs(answer: answer / num[d], d: d + 1)
            default:
                break
            }
            op[i] += 1
        }
    }
    
    dfs(answer: num[0], d: 1)
    print(maxN)
    print(minN)
}
main()
