import Foundation

func dfs(_ b: [Character], _ i: Int, _ depth: Int) -> Bool {
    if depth == 0 {   // 리프 노드에 도달했다면
        return true   // 포화 이진 트리
    }
    
    // 부모 노드가 '0'일 때
    // 왼쪽 자식 노드가 '1'이거나 오른쪽 자식 노드가 '1'이라면 포화 이진 트리가 될 수 없음
    if b[i] == "0" {
        if b[i - depth] == "1" || b[i + depth] == "1" {
            return false
        }
    }
    
    // 왼쪽 서브 트리 탐색
    let left = dfs(b, i - depth, depth / 2)
    // 오른쪽 서브 트리 탐색
    let right = dfs(b, i + depth, depth / 2)
    
    return left && right
}

func solution(_ numbers: [Int64]) -> [Int] {
    var answer: [Int] = []
    
    for num in numbers {
        let b = String(num, radix: 2)
        let bArray = Array(b)
        let nodes = String(bArray.count + 1, radix: 2)
        
        var binaryString = b
        // 포화 이진 트리가 아닌 경우 더미 노드(0 추가)
        if nodes.dropFirst().contains("1") {
            let dummies = (1 << nodes.count) - Int(nodes, radix: 2)!
            binaryString = String(repeating: "0", count: dummies) + binaryString
        }
        
        let binaryArray = Array(binaryString)
        let result = dfs(binaryArray, binaryArray.count / 2, (binaryArray.count + 1) / 4)
        answer.append(result ? 1 : 0)
    }
    
    return answer
}