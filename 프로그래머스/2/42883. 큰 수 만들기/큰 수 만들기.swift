import Foundation

func solution(_ number: String, _ k: Int) -> String {
    var stack = [Character]()
    var k = k

    for num in number {
        while k > 0 && !stack.isEmpty && stack.last! < num {
            stack.removeLast()
            k -= 1
        }
        stack.append(num)
    }
    
    if k > 0 {
        stack = Array(stack.dropLast(k))
    }
    
    return String(stack)
}
