import Foundation

func main() {
    let n = Int(readLine()!)!
    var result = 0
    for _ in 0..<n {
        let s = readLine()!.map { String($0) }
        var stack: [String] = []
        for i in 0..<s.count {
            guard !stack.isEmpty else {
                stack.append(s[i])
                continue
            }
            if stack[stack.count-1] == s[i] {
                stack.removeLast()
            } else {
                stack.append(s[i])
            }
        }
        if stack.isEmpty { result += 1 }
    }
    print(result)
}
main()