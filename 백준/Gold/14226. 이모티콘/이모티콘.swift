func bfs(_ s: Int, _ visited: inout [[Bool]]) -> Int {
    var queue: [(Int,Int,Int)] = []
    queue.append((1, 0, 0))
    visited[1][0] = true
    
    var index = 0
    while index < queue.count {
        let (screen, clipboard, time) = queue[index]
        index += 1
        
        if screen == s {
            return time
        }
        
        if screen > 0 && screen <= s && !visited[screen][screen] {
            visited[screen][screen] = true
            queue.append((screen, screen, time + 1))
        }
        
        if clipboard > 0 && screen + clipboard <= s && !visited[screen + clipboard][clipboard] {
            visited[screen + clipboard][clipboard] = true
            queue.append((screen + clipboard, clipboard, time + 1))
        }
        
        if screen - 1 >= 0 && !visited[screen - 1][clipboard] {
            visited[screen - 1][clipboard] = true
            queue.append((screen - 1, clipboard, time + 1))
        }
    }
    
    return -1
}

func main() {
    let s = Int(readLine()!)!
    var visited = Array(repeating: Array(repeating: false, count: s + 1), count: s + 1)
    print(bfs(s, &visited))
}

main()