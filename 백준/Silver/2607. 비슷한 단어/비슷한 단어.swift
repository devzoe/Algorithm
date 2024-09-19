import Foundation

func main() {
    let N = Int(readLine()!)!
    let target = Array(readLine()!)
    var answer = 0
    
    for _ in 0..<(N-1) {
        var compare = target
        let word = Array(readLine()!)
        var cnt = 0
        
        for w in word {
            if let index = compare.firstIndex(of: w) {
                compare.remove(at: index)
            } else {
                cnt += 1
            }
        }
        
        if cnt < 2 && compare.count < 2 {
            answer += 1
        }
    }

    print(answer)
}
main()