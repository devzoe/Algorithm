import Foundation

func check(_ s: String) -> Bool {
    var stack: [Character] = []
    for ch in s {
        if ch == "(" {
                stack.append(ch)
        } else {
            if !stack.isEmpty {
                stack.removeLast()
            } else {
                return false
            }
        }     
    }
    return stack.isEmpty ? true : false
}
func reverseDirection(_ s: String) -> String {
    let l = s.index(s.startIndex, offsetBy: 1)
    let r = s.index(s.endIndex, offsetBy: -1)
    let newS = s[l..<r]
    guard newS != "" else { return "" }
    var result = ""
    for ch in newS {
        if ch == "(" {
            result += ")"
        } else {
            result += "("
        }
    }
    return result
}
func make(_ w: String) -> String {
    if w == "" { return "" }
    var cnt = 0
    var u = ""
    for s in w {
        if cnt > 0 && u.filter{$0 == "("}.count == u.filter{ $0 == ")"}.count {
            break
        }
        cnt += 1
        u += String(s)
    }
    let idx = w.index(w.startIndex, offsetBy: cnt)
    let v = String(w[idx...])
    if check(u) {
        return u + make(v)
    } else {
        return "(" + make(v) + ")" + reverseDirection(u)
    }
}

func solution(_ p:String) -> String {
    return check(p) ? p : make(p)
}