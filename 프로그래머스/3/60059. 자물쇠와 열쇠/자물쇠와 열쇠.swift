import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    let n = lock.count
    let m = key.count
    let extendedSize = n + 2 * (m - 1)

    func rotate(_ key: [[Int]]) -> [[Int]] {
        var rotatedKey = Array(repeating: Array(repeating: 0, count: m), count: m)
        for y in 0..<m {
            for x in 0..<m {
                rotatedKey[x][m-1-y] = key[y][x]
            }
        }
        return rotatedKey
    }

    func canUnlock(_ startX: Int, _ startY: Int, _ key: [[Int]]) -> Bool {
        var extendedLock = Array(repeating: Array(repeating: 0, count: extendedSize), count: extendedSize)
        
        for y in 0..<n {
            for x in 0..<n {
                extendedLock[y + m - 1][x + m - 1] = lock[y][x]
            }
        }

        for y in 0..<m {
            for x in 0..<m {
                let ny = startY + y
                let nx = startX + x
                if ny >= 0 && ny < extendedSize && nx >= 0 && nx < extendedSize {
                    extendedLock[ny][nx] += key[y][x]
                }
            }
        }

        for y in 0..<n {
            for x in 0..<n {
                if extendedLock[y + m - 1][x + m - 1] != 1 {
                    return false
                }
            }
        }
        return true
    }

    var rotatedKey = key
    for _ in 0..<4 {
        for startY in 0..<(n + m - 1) {
            for startX in 0..<(n + m - 1) {
                if canUnlock(startX, startY, rotatedKey) {
                    return true
                }
            }
        }
        rotatedKey = rotate(rotatedKey)
    }

    return false
}