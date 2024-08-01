func solution() -> Bool {
    let word = readLine()!
    var stack: [Character] = []
    word.forEach {
        if !stack.isEmpty && stack.last! == $0 {
            stack.removeLast()
        }
        stack.append($0)
    }
    return Set(stack).count == stack.count
}

let n = Int(readLine()!)!
var answer = 0

(1...n).forEach { _ in
    if solution() {
        answer += 1
    }
}

print(answer)