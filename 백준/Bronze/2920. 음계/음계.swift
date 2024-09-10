let arr = readLine()!.split(separator: " ").map { Int($0)! }
var mixed = false
var ascending = true
var descending = true
var pre = arr[0]
for i in 1..<arr.count {
    if arr[i] - pre == 1 { descending = false }
    else if arr[i] - pre == -1 { ascending = false}
    else { mixed = true }
    pre = arr[i]
}
if mixed { print("mixed")}
else if ascending { print("ascending")}
else { print("descending")}