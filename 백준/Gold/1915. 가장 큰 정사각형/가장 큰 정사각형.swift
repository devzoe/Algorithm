import Foundation

func readInput() -> (Int, Int, [String]) {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let Y = firstLine[0]
    let X = firstLine[1]

    var graphInput = [String]()
    for _ in 0..<Y {
        let line = readLine()!
        graphInput.append(line)
    }
    
    return (Y, X, graphInput)
}

func maxSquareArea(Y: Int, X: Int, graphInput: [String]) -> Int {
    var graph = [[Int]]()
    
    for line in graphInput {
        let row = line.map { Int(String($0))! }
        graph.append(row)
    }

    var result = 0

    for i in 0..<Y {
        for j in 0..<X {
            if i > 0 && j > 0 && graph[i][j] == 1 {
                graph[i][j] += min(graph[i][j-1], graph[i-1][j], graph[i-1][j-1])
            }
            result = max(result, graph[i][j])
        }
    }

    return result * result
}

let (Y, X, graphInput) = readInput()
let area = maxSquareArea(Y: Y, X: X, graphInput: graphInput)
print(area)