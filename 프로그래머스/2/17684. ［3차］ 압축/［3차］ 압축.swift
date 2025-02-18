func solution(_ msg:String) -> [Int] {
    var dict: [String:Int] = [:]
    for n in 0..<26 {
        dict[String(UnicodeScalar(n+65)!)] = n + 1
    }
    var cnt = 26
    var str = ""
    var result: [Int] = [0]
    for i in 0..<msg.count {
        str += String(msg[msg.index(msg.startIndex,offsetBy:i)])
        if !dict.keys.contains(str) {
            cnt += 1
            dict[str, default:0] = cnt
            str = String(msg[msg.index(msg.startIndex,offsetBy:i)])
            result.append(dict[str]!)
        } else {
            result[result.count-1] = dict[str]!
        }
    }
    return result
}