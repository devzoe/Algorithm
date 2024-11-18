import Foundation

func main() {
    let str = Array(readLine()!)
    let target = Array(readLine()!)
    let targetCnt = target.count
    var stack = [Character]()

    for char in str {
        stack.append(char)

        if stack.count >= targetCnt {
            var match = true
            for i in 0..<targetCnt {
                if stack[stack.count - targetCnt + i] != target[i] {
                    match = false
                    break
                }
            }
            if match {
                stack.removeLast(targetCnt)
            }
        }
    }

    print(stack.isEmpty ? "FRULA" : String(stack))
}

main()
