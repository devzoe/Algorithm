import Foundation

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, b) = (firstLine[0], firstLine[1], firstLine[2])

var block = [[Int]]()

for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    block.append(row)
}

var answer = Int.max
var groundLevel = 0

for targetHeight in 0...256 {
    var takeBlock = 0
    var useBlock = 0

    for x in 0..<n {
        for y in 0..<m {
            let height = block[x][y]
            if height > targetHeight {
                takeBlock += height - targetHeight
            } else {
                useBlock += targetHeight - height
            }
        }
    }

    if useBlock > takeBlock + b {
        continue
    }

    let time = takeBlock * 2 + useBlock
    if time <= answer {
        answer = time
        groundLevel = targetHeight
    }
}

print("\(answer) \(groundLevel)")
