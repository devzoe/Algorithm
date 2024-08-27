import Foundation

func solution(_ s: String) -> Int {
    var stack: [Character] = []
    var temp = 1
    var result = 0
    
    for (i, char) in s.enumerated() {
        if char == "(" {
            stack.append(char)
            temp *= 2
        } else if char == "[" {
            stack.append(char)
            temp *= 3
        } else if char == ")" {
            if stack.isEmpty || stack.last != "(" {
                return 0
            }
            if s[s.index(s.startIndex, offsetBy: i - 1)] == "(" {
                result += temp
            }
            stack.removeLast()
            temp /= 2
        } else if char == "]" {
            if stack.isEmpty || stack.last != "[" {
                return 0
            }
            if s[s.index(s.startIndex, offsetBy: i - 1)] == "[" {
                result += temp
            }
            stack.removeLast()
            temp /= 3
        }
    }
    
    return stack.isEmpty ? result : 0
}

let input = readLine()!
print(solution(input))
