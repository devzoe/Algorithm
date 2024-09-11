let line = readLine()!.split(separator: " ").map { Int($0)! }
let N = line[0], K = line[1], D = line[2]

var rule: [(start: Int, end: Int, step: Int)] = []

for _ in 0..<K {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    rule.append((line[0], line[1], line[2]))
}

var start = 1
var end = N
var answer = 0

while start <= end {
    let mid = (start + end) / 2
    var total = 0
    
    for r in rule {
        if r.end < mid {
            total += (r.end - r.start) / r.step + 1
        } else if r.start > mid {
            continue
        } else {
            total += (mid - r.start) / r.step + 1
        }
        if total >= D {
            break
        }
    }
    
    if total >= D {
        answer = mid
        end = mid - 1
    } else {
        start = mid + 1
    }
}

print(answer)