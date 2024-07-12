import Foundation

let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

func readInput() -> (Int, Int, Int, [[Int]], Int, Int, [(Int, Int)]) {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let N = firstLine[0]
    let initialStamina = firstLine[1]
    let staminaGain = firstLine[2]
    
    var map = [[Int]]()
    var mint = [(Int, Int)]()
    var startX = 0
    var startY = 0
    
    for y in 0..<N {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        map.append(line)
        for x in 0..<N {
            if line[x] == 1 {
                startX = x
                startY = y
            } else if line[x] == 2 {
                mint.append((y, x))
            }
        }
    }
    
    return (N, initialStamina, staminaGain, map, startX, startY, mint)
}

func isValid(x: Int, y: Int, N: Int) -> Bool {
    return x >= 0 && x < N && y >= 0 && y < N
}

func dfs(x: Int, y: Int, stamina: Int, count: Int, map: inout [[Int]], startX: Int, startY: Int, N: Int, staminaGain: Int, mint: [(Int, Int)], visited: inout [Bool], ans: inout Int) {
    for i in 0..<mint.count {
        if !visited[i] {
            let (mintY, mintX) = mint[i]
            let distance = abs(mintY - y) + abs(mintX - x)
            if stamina >= distance {
                visited[i] = true
                dfs(x: mintX, y: mintY, stamina: stamina - distance + staminaGain, count: count + 1, map: &map, startX: startX, startY: startY, N: N, staminaGain: staminaGain, mint: mint, visited: &visited, ans: &ans)
                visited[i] = false
            }
        }
    }
    
    if stamina >= abs(startY - y) + abs(startX - x) {
        ans = max(ans, count)
    }
}

func main() {
    let (N, initialStamina, staminaGain, mapInput, startX, startY, mint) = readInput()
    var map = mapInput
    var visited = [Bool](repeating: false, count: mint.count)
    var ans = 0
    
    dfs(x: startX, y: startY, stamina: initialStamina, count: 0, map: &map, startX: startX, startY: startY, N: N, staminaGain: staminaGain, mint: mint, visited: &visited, ans: &ans)
    print(ans)
}

main()