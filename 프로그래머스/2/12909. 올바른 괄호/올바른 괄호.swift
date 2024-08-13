import Foundation

func solution(_ s:String) -> Bool
{
    var stack: [Character] = [Character]()
    for i in s {
        if i == "(" {
            stack.append(i)
        } else {
            if stack.isEmpty {
                return false
            } else {
                stack.removeLast()
            }
        }
    }
    
    return stack.isEmpty ? true : false
}