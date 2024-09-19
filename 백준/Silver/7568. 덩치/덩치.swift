func main() {
    let N = Int(readLine()!)! // 사람 수
    var people: [(Int, Int)] = []
    
    for _ in 0..<N {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let weight = input[0]
        let height = input[1]
        people.append((weight, height))
    }
    
    var ranks = [Int](repeating: 1, count: N)
    
    for i in 0..<N {
        for j in 0..<N {
            if i != j {
                if people[i].0 < people[j].0 && people[i].1 < people[j].1 {
                    ranks[i] += 1
                }
            }
        }
    }

    print(ranks.map { String($0) }.joined(separator: " "))
}
main()