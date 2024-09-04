let dice = readLine()!.split(separator: " ").map { Int($0)! }
var dict: [Int:Int] = [:]
dice.forEach { dict[$0, default: 0] += 1 }
var result = 0

if dict.keys.count == 3 {
    result = dict.keys.max()! * 100
} else if dict.keys.count == 2 {
    let key = Array(dict.keys)
    
    if dict[key[0]]! > dict[key[1]]! {
        result = 1000 + (key[0])  * 100
    } else {
        result = 1000 + (key[1])  * 100
    }
} else {
    let keys = Array(dict.keys)
    let key = keys[0]
    result = 10000 + (key) * 1000
}
print(result)