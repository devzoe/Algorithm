let str = readLine()!
var dict: [Int:Int] = [:]

for s in str {
    dict[Int(s.asciiValue!), default: 0] += 1
}

for i in 97...122 {
    if dict.keys.contains(i) {
        print(dict[i]!, terminator: " ")
    } else {
        print(0, terminator: " ")
    }
}