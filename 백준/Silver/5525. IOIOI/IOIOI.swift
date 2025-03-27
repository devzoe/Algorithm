import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let s = Array(readLine()!)
var ioi = "IOI"
for _ in 1..<n {
    ioi += "OI"
}
let len = ioi.count
var fixed = ""
for i in 0..<len {
    fixed += String(s[i])
}
var result = 0
if fixed == ioi { result += 1 }
for i in len..<s.count {
    fixed.removeFirst()
    fixed += String(s[i])
    if fixed == ioi {
        result += 1
    }
}
print(result)