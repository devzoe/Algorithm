import Foundation

func permutation(_ arr: [String]) -> [[String]] {
    var result: [[String]] = []
    func backtrack(_ curr: Int, _ ans: inout [String]) {
        if ans.count == arr.count {
            result.append(ans)
            return
        }
        for i in 0..<arr.count {
            if !ans.contains(arr[i]) {
                ans.append(arr[i])
                backtrack(curr+1, &ans)
                ans.removeLast()
            }
        }
    }
    var ans: [String] = []
    backtrack(0,&ans)
    return result
}
func solution(_ expression:String) -> Int64 {
    let op = ["+","*","-"]
    var opr: [String] = []
    expression.forEach { 
        if op.contains(String($0)) {
            opr.append(String($0))
        }
    }
    var opSet: Set<String> = Set(opr)
    var n = expression
    for o in opSet {
        n = n.replacingOccurrences(of: o, with: " ")
    }
    var num = n.split(separator: " ").map { Int($0)! }
    let order = permutation(Array(opSet))
    var maxValue = Int.min
    for o in order {
        var tempOp = opr
        var tempNum = num
        for item in o {
            var i = 0
            var cnt = 0
            let l = tempNum.count
            while cnt < l {
                if i >= tempOp.count { break } 
                cnt += 1
                if tempOp[i] == item {
                    var temp = 0
                    switch item {
                    case "+":
                        temp = tempNum[i] + tempNum[i+1]      
                    case "*":
                        temp = tempNum[i] * tempNum[i+1]
                    case "-":
                          temp = tempNum[i] - tempNum[i+1]  
                    default:
                        break
                    }
                    tempNum[i+1] = temp
                    tempOp.remove(at:i)
                    tempNum.remove(at:i)
                    continue
                }
                i += 1
            }
        }
        tempNum = tempNum.map { abs($0) }
        maxValue = max(maxValue, tempNum.max()!)
    }
    return Int64(maxValue)
}