let n = Int(readLine()!)!
let ox = readLine()!
var bonus = 0
var total = 0
for (i,s) in ox.enumerated() {
    if s == "O" {
        total += i+bonus+1
        bonus += 1
    } else {
        bonus = 0
    }
}
print(total)