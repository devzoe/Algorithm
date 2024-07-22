import Foundation

func diffCount(_ str1: String , _ str2: String) -> Int {
    let str1 = Array(str1), str2 = Array(str2)
    var count = 0
    for i in 0..<str1.count {
        if str1[i] != str2[i] {
            count += 1
        }
    }
    
    return count
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target), begin != target else { return 0 }
    
    var needChanged: [(str: String, cnt: Int)] = [(begin, 0)]
    var index = 0
    while !needChanged.isEmpty {
        let node = needChanged[index]
        index += 1

        let word = node.str
        let count = node.cnt
        
        for nextWord in words {
            if diffCount(word, nextWord) == 1 {
                if nextWord == target {
                    return count + 1
                } else {
                    needChanged.append((nextWord, count + 1))
                }
            }
        }
    }
    
    return 0
}