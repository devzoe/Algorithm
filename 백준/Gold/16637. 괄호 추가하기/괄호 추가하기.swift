import Foundation

var maxResult = Int.min
var numbers = [Int]()   
var opers = [Character]()  

func operate(_ op: Character, _ a: Int, _ b: Int) -> Int {
    switch op {
    case "+": return a + b
    case "-": return a - b
    case "*": return a * b
    default: fatalError("지원하지 않는 연산자입니다.")
    }
}

func dfs(index: Int, current: Int) {
    if index == numbers.count - 1 {
        maxResult = max(maxResult, current)
        return
    }
    
    let noParen = operate(opers[index], current, numbers[index + 1])
    dfs(index: index + 1, current: noParen)
    
    if index + 2 < numbers.count {
        let temp = operate(opers[index + 1], numbers[index + 1], numbers[index + 2])
        let withParen = operate(opers[index], current, temp)
        dfs(index: index + 2, current: withParen)
    }
}


let n = Int(readLine()!)!
let expression = readLine()! 
let exprChars = Array(expression)
for i in 0..<n {
    if i % 2 == 0 {
        if let digit = exprChars[i].wholeNumberValue {
            numbers.append(digit)
        }
    } else {
        opers.append(exprChars[i])
    }
}
    
dfs(index: 0, current: numbers[0])
print(maxResult)