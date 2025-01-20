func solution(_ str1:String, _ str2:String) -> Int {
    var s1: [String] = []
    var s2: [String] = []
    let upperS1 = str1.uppercased()
    let upperS2 = str2.uppercased()
    var d1: [String:Double] = [:]
    var d2: [String:Double] = [:]
    for i in 0..<str1.count-1 {
        var check = true
        let s = upperS1[upperS1.index(upperS1.startIndex,offsetBy:i)...upperS1.index(upperS1.startIndex,offsetBy:i+1)]
        s.forEach {
            if $0 < "A" || $0 > "Z" {
                check = false 
            }
        }
        if check { 
            s1.append(String(s)) 
            d1[String(s),default:0] += 1
        }
    }
    for i in 0..<str2.count-1 {
        var check = true
        let s = upperS2[upperS2.index(upperS2.startIndex,offsetBy:i)...upperS2.index(upperS2.startIndex,offsetBy:i+1)]
        s.forEach {
            if $0 < "A" || $0 > "Z" {
                check = false
            }
        }
        if check { 
            s2.append(String(s)) 
            d2[String(s),default:0] += 1
        }
    }
    var union: Double = 0
    var sub: Double = 0
    for s in d1.keys {
        if let item1 = d1[s] {
            if let item2 = d2[s] {
                if item1 >= item2 {
                    union += item1
                    sub += item2
                } else {
                    union += item2
                    sub += item1
                }
                d2[s] = nil
            } else {
                union += item1
            }
        }
    }
    for s in d2.keys {
        union += d2[s]!
    }
    return union > 0 ? Int(65536*(sub/union)) : 65536
}