import Foundation

func solution(_ n: Int, _ info: [Int]) -> [Int] {
    var max = 0
    var best = [-1]
    var stack = [(a: 0, l: 0, idx: 0, arrow: 0, shot: Array(repeating: 0, count: 11))]

    while !stack.isEmpty {
        let current = stack.removeLast()
        let (a, l, idx, arrow, shot) = current
        if arrow > n {
            continue
        }
        if idx == 11 {
            let score = l - a
            if score > max {
                max = score
                best = shot
                best[10] += (n - arrow)
            }
            continue
        }

        stack.append((a + (info[10 - idx] > 0 ? idx : 0), l, idx + 1, arrow, shot))

        if arrow + info[10 - idx] + 1 <= n {
            var newShot = shot
            newShot[10 - idx] = info[10 - idx] + 1
            stack.append((a, l + idx, idx + 1, arrow + newShot[10 - idx], newShot))
        }
    }

    return best
}