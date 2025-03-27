import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let s = Array(readLine()!)
var result = 0
var cnt = 0
var i = 0
while i+2 < m {
    if s[i] == "I" && s[i+1] == "O" && s[i+2] == "I" {
        i += 2
        cnt += 1
        if cnt == n {
            result += 1
            cnt -= 1
        }
    } else {
        i += 1
        cnt = 0
    }
}
print(result)