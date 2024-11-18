import Foundation

func solution(_ expressions: [String]) -> [String] {
    var answer = [String]()
    var answerFormat = [Int]()
    var hint = [String]()
    var maxFormat = 0
    
    for exp in expressions {
        let e = exp.split(separator: " ")
        let n1 = e[0]
        let oper = e[1]
        let n2 = e[2]
        let ans = e[4]
        
        maxFormat = max(maxFormat, n1.compactMap { Int(String($0)) }.max() ?? 0)
        maxFormat = max(maxFormat, n2.compactMap { Int(String($0)) }.max() ?? 0)
        
        if ans != "X" {
            hint.append(exp)
            maxFormat = max(maxFormat, ans.compactMap { Int(String($0)) }.max() ?? 0)
        } else {
            answer.append(exp)
        }
    }
    
    for n in (maxFormat + 1)...9 {
        var isValid = true
        for h in hint {
            let e = h.split(separator: " ")
            let n1 = Int(e[0], radix: n)!
            let n2 = Int(e[2], radix: n)!
            let result = Int(e[4], radix: n)!
            
            if (e[1] == "+" && n1 + n2 != result) ||
               (e[1] == "-" && n1 - n2 != result) {
                isValid = false
                break
            }
        }
        if isValid { answerFormat.append(n) }
    }

    guard !answerFormat.isEmpty else { return [] }
    
    for i in 0..<answer.count {
        let e = answer[i].split(separator: " ")
        let n1 = e[0]
        let oper = e[1]
        let n2 = e[2]
        
        var ansSet = Set<String>()
        for n in answerFormat {
            let n1Ten = Int(n1, radix: n)!
            let n2Ten = Int(n2, radix: n)!
            
            let result: Int
            if oper == "+" {
                result = n1Ten + n2Ten
            } else {
                result = n1Ten - n2Ten
            }
            
            ansSet.insert(String(result, radix: n))
        }
        
        if ansSet.count == 1 {
            answer[i] = "\(n1) \(oper) \(n2) = \(ansSet.first!)"
        } else {
            answer[i] = "\(n1) \(oper) \(n2) = ?"
        }
    }
    
    return answer
}
