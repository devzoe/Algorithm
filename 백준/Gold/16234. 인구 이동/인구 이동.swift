import Foundation

func readInput() -> (Int, Int, Int, [[Int]]) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let N = input[0], L = input[1], R = input[2]
    
    var population = [[Int]]()
    for _ in 0..<N {
        population.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    return (N,L,R,population)
}

func bfs(_ N: Int, _ L: Int, _ R: Int , _ population: inout [[Int]], _ startX: Int, _ startY: Int, _ visited: inout [[Bool]]) -> [(Int, Int)] {
    let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var queue = [(startX, startY)]
    var union = [(startX, startY)]
    var total = population[startX][startY]
    visited[startX][startY] = true
    var index = 0
    
    while index < queue.count {
        let (x, y) = queue[index]
        index += 1
        
        for direction in directions {
            let newX = x + direction.0
            let newY = y + direction.1
            
            if newX >= 0 && newX < N && newY >= 0 && newY < N && !visited[newX][newY] {
                let diff = abs(population[x][y] - population[newX][newY])
                if diff >= L && diff <= R {
                    visited[newX][newY] = true
                    queue.append((newX, newY))
                    union.append((newX, newY))
                    total += population[newX][newY]
                }
            }
        }
    }
    
    let avg = total / union.count
    for (x, y) in union {
        population[x][y] = avg
    }
    
    return union
}
func main() {
    var (N,L,R,population) = readInput()
    var days = 0
    while true {
        var visited = Array(repeating: Array(repeating: false, count: N), count: N)
        var isMoved = false
        
        for i in 0..<N {
            for j in 0..<N {
                if !visited[i][j] {
                    let union = bfs(N, L, R, &population, i, j, &visited)
                    if union.count > 1 {
                        isMoved = true
                    }
                }
            }
        }
        
        if !isMoved {
            break
        }
        
        days += 1
    }
    print(days)
}
main()
