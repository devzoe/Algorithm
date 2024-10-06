struct Node {
    let current: Int
    let maxIntensity: Int
}

func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    var answer: [Int] = [Int.max,Int.max]
    var connection: [Int:[[Int]]] = [:]
    var summitDic: [Int:Bool] = [:]
    var gateDic: [Int:Bool] = [:]
    var bfsQueue: [Node] = []
    var intensities: [Int] = Array(repeating: Int.max, count: n+1)
    
    for summit in summits {
        summitDic[summit] = true
    }
    
    for gate in gates {
        gateDic[gate] = true
    }
    
    for path in paths {
        connection[path[0],default:[]].append([path[1],path[2]])
        connection[path[1],default:[]].append([path[0],path[2]])
    }

    func checkNextNode(_ node: Node) {
        if summitDic[node.current] != nil || node.maxIntensity > intensities[node.current] {
            return
        }
        
        for next in connection[node.current,default:[]] where gateDic[next[0]] == nil {
            let maxIntensity = max(node.maxIntensity,next[1])
            
            if maxIntensity < intensities[next[0]] {
                updateAnswer(next[0], maxIntensity)
                intensities[next[0]] = maxIntensity
                bfsQueue.append(Node(current: next[0], maxIntensity:maxIntensity))
            }
        }
    }
    
    func bfs() {
        while !bfsQueue.isEmpty {
            let first = bfsQueue.removeFirst()
            checkNextNode(first)
        }
    }

    for gate in gates {
        bfsQueue.append(Node(current: gate, maxIntensity: -1))
        bfs()
    }
    
    func updateAnswer(_ index: Int,_ maxIntensity: Int) {
        if summitDic[index] != nil {
            if maxIntensity == answer[1] {
                answer[0] = min(answer[0],index)
            } else if maxIntensity < answer[1] {
                answer = [index,maxIntensity]
            }
        }
    }
                                  
    return answer
}