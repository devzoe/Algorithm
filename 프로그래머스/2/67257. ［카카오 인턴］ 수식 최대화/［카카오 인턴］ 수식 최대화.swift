import Foundation

func permutations<T>(_ array: [T], _ k: Int) -> [[T]] {
    var result: [[T]] = []

    func backtracking(_ ans: inout [T], _ visited: inout [Bool]) {
        if ans.count == k {
            result.append(ans)
            return
        }

        for i in 0..<array.count {
            if visited[i] {
                continue
            }

            visited[i] = true
            ans.append(array[i])
            backtracking(&ans, &visited)
            ans.removeLast()
            visited[i] = false
        }
    }

    var ans: [T] = []
    var visited = Array(repeating: false, count: array.count)
    backtracking(&ans, &visited)
    return result
}

func solution(_ expression:String) -> Int64 {
    let originalOperand = expression.components(separatedBy: ["+","-","*"]).map{ Int($0)! }
    let originalOps = Array(expression.filter { !($0.isNumber) })
    let op = Array(Set(originalOps))
    var maxNum = -1
    
    let permu = permutations(op, op.count)
    
    for pm in permu {
        var operand = originalOperand
        var ops = originalOps
        
        for p in pm {
            var i = 0
            while i < ops.count {
                var n = 0
                if ops[i] == p {
                    switch p {
                    case "+":
                        n = operand[i] + operand[i+1]
                    case "-":
                        n = operand[i] - operand[i+1]
                    case "*":
                        n = operand[i] * operand[i+1]
                    default:
                        break
                    }
                
                    operand[i] = n
                    operand.remove(at: i+1)
                    ops.remove(at: i)
                } else {
                    i += 1
                }
            }
        }
        maxNum = max(abs(operand[0]), maxNum)
    }
    return Int64(maxNum)
}