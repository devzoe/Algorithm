import Foundation

func solution(_ topping: [Int]) -> Int {
    var dict = [Int: Int]()
    var setDict = Set<Int>()
    var result = 0
    
    for t in topping {
        dict[t, default: 0] += 1
    }
    
    for i in topping {
        if let count = dict[i] {
            if count == 1 {
                dict.removeValue(forKey: i)
            } else {
                dict[i] = count - 1
            }
        }
        
        setDict.insert(i)
        
        if dict.count == setDict.count {
            result += 1
        }
    }
    
    return result
}

