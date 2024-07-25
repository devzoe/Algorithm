import Foundation

func solution(_ topping: [Int]) -> Int {
    var dic = [Int: Int]()
    for t in topping {
        dic[t, default: 0] += 1
    }
    
    var setDic = Set<Int>()
    var res = 0
    
    for i in topping {
        if let count = dic[i] {
            if count == 1 {
                dic.removeValue(forKey: i)
            } else {
                dic[i] = count - 1
            }
        }
        setDic.insert(i)
        
        if dic.count == setDic.count {
            res += 1
        }
    }
    
    return res
}
