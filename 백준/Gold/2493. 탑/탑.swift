import Foundation

func main() {
    let n = Int(readLine()!)!
    let heights = readLine()!.split(separator: " ").map { Int(String($0))! }

    var stack = [(Int, Int)]() 
    var result = Array(repeating: 0, count: n)

    for i in 0..<n {
        let currentHeight = heights[i]
    
        while !stack.isEmpty && stack.last!.1 <= currentHeight {
            stack.removeLast()
        }
    
        if !stack.isEmpty {
            result[i] = stack.last!.0 + 1 
        }

        stack.append((i, currentHeight))
    }
    print(result.map { String($0) }.joined(separator: " "))
}
main()