import Foundation

func readInput() -> (Int, [String]) {
    let nk = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nk[0]
    let k = nk[1]
    
    var words: [String] = []
    
    for _ in 0..<n {
        if let word = readLine() {
            words.append(word)
        }
    }
    return (k, words)
}

func solution(words: [String], k: Int) -> Int {
    if k < 5 {
        return 0
    }  
    var wordMasks = [Int]()
    
    for word in words {
        var bitmask = 0
        for chr in word {
            bitmask |= (1 << Int(chr.asciiValue! - 97))
        }
        wordMasks.append(bitmask)
    }
    
    let letter: [Character] = ["a", "n", "t", "i", "c"]
    var base = 0
    
    for chr in letter {
        base |= (1 << Int(chr.asciiValue! - 97))
    }
    
    func countWords(_ bitmask: Int) -> Int {
        var count = 0
        for wordMask in wordMasks {
            if (wordMask & bitmask) == wordMask {
                count += 1
            }
        }
        return count
    }
    
    var maxCount = 0
    
    func dfs(_ index: Int, _ bitmask: Int, _ depth: Int) {
        if depth == k - 5 {
            maxCount = max(maxCount, countWords(bitmask))
            return
        }
        
        for i in index..<26 {
            if (bitmask & (1 << i)) == 0 {
                dfs(i + 1, bitmask | (1 << i), depth + 1)
            }
        }
    }
    
    dfs(0, base, 0)
    return maxCount
}

let (k, words) = readInput()
let result = solution(words: words, k: k)
print(result)