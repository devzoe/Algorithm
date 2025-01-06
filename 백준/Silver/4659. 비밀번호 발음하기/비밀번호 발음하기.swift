import Foundation

func main() {
    let v = ["a","e","i","o","u"]
    loop: while true {
        let s = readLine()!
        if s == "end" { return }
        var first = false
        var vStack: [Int] = []
        var stack: [Character] = []
        for i in s {
            if stack.isEmpty {
                stack.append(i)
            } else {
                if stack[stack.count-1] == i {
                    if i == "e" || i == "o" {
                        stack.removeLast()
                    } else {
                        print("<\(s)> is not acceptable.")
                        continue loop
                    }
                } else {
                    stack.append(i)
                }
            }
            if v.contains(String(i)) { // 모음
                first = true
                if vStack.count < 2 {
                    vStack.append(0)
                } else {
                    if vStack[vStack.count-1] == 0 && vStack[vStack.count-2] == 0 {
                        print("<\(s)> is not acceptable.")
                        continue loop
                    } else {
                        vStack.append(0)
                    }
                }
            } else { // 자음
                if vStack.count < 2 {
                    vStack.append(1)
                } else {
                    if vStack[vStack.count-1] == 1 && vStack[vStack.count-2] == 1 {
                        print("<\(s)> is not acceptable.")
                        continue loop
                    } else {
                        vStack.append(1)
                    }
                }
            }
        }
        if first {
            print("<\(s)> is acceptable.")
        } else {
            print("<\(s)> is not acceptable.")
        }
    }
}
main()