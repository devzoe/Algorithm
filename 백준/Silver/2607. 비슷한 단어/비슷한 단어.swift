import Foundation

func readInput() -> (String, [String]) {
    let n = Int(readLine()!)!
    let target = readLine()!
    var words: [String] = []
    for _ in 0..<n-1 {
        words.append(readLine()!)
    }
    return (target, words)
}

func count(_ word: String) -> [Character: Int] {
    var counts: [Character: Int] = [:]
    for char in word {
        counts[char, default: 0] += 1
    }
    return counts
}

func solution(_ word1: String, _ word2: String) -> Bool {
    let counts1 = count(word1)
    let counts2 = count(word2)
    
    if counts1 == counts2 {
        return true
    }
    
    if abs(word1.count - word2.count) > 1 {
        return false
    }
    
    let allChars = Set(counts1.keys).union(counts2.keys)
    var differences = 0
    
    for char in allChars {
        let diff = abs((counts1[char] ?? 0) - (counts2[char] ?? 0))
        differences += diff
        if differences > 2 {
            return false
        }
    }
    
    return true
}

func main() {
    let (target, words) = readInput()
    let result = words.filter { solution(target, $0) }.count
    print(result)
}

main()