import Foundation

func solution(_ s:String) -> Int{
    var stack: [Character] = []
    for ch in s {
        if stack.isEmpty {
            stack.append(ch)
        } else {
            if ch == stack[stack.endIndex-1] {
                stack.removeLast()
            } else {
                stack.append(ch)
            }
        }
    }

    return stack.isEmpty ? 1 : 0
}