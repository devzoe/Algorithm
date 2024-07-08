import Foundation

func readInput() -> (Int, Int, [[Int]]) {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let N = firstLine[0]
    let M = firstLine[1]

    var city = [[Int]]()
    for _ in 0..<N {
        let cityLine = readLine()!.split(separator: " ").map { Int($0)! }
        city.append(cityLine)
    }
    return (N, M, city)
}

//조합
func combination<T>(_ array: [T], _ r: Int) -> [[T]] {
    if r == 0 { return [[]] }
    guard let first = array.first else { return [] }
    
    let head = [first]
    let subarray = Array(array.dropFirst())
    
    let withFirst = combination(subarray, r - 1).map { head + $0 }
    let withoutFirst = combination(subarray, r)
    
    return withFirst + withoutFirst
}

func calculateCost(N: Int, M: Int, city: [[Int]]) -> Int {
    var house = [[Int]]()
    var chicken = [[Int]]()
    for i in 0..<N {
        for j in 0..<N {
            if city[i][j] == 1 { //집
                house.append([i,j])
            } else if city[i][j] == 2 {//치킨집
                chicken.append([i,j])
            }
        }
    }
    let combi = combination(chicken, M)
    var result = [Int]()
    
    for combination in combi {
        var selectedDistance = 0
        for h in house {
            var minDistance = 100000
            for j in combination {
                let distance = abs(j[0]-h[0]) + abs(j[1]-h[1])
                if distance < minDistance {
                    minDistance = distance
                }
            }
            selectedDistance += minDistance
        }
        result.append(selectedDistance)
    }
    return result.min() ?? -1
}

let (N, M, city) = readInput()
let result = calculateCost(N: N, M: M, city: city)
print(result)