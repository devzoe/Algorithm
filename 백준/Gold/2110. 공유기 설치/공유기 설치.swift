import Foundation

func readInput() -> (Int, Int, [Int]) {
    let firstLine = readLine()!.split(separator: " ").map{Int(($0))!}
    let N = firstLine[0]
    let C = firstLine[1]
    
    var router = [Int]()
    for _ in 0..<N{
        router.append(Int(readLine()!)!)
    }
    router.sort()
    return (N, C, router)
}

func maxDistance(N: Int, C: Int, router: [Int]) -> Int {
    let maxR = router[N - 1]
    let minR = router[0]
    var start = 1
    var end = maxR - minR
    var result = 0

    while start <= end{
        var count = 1
        let mid = (start + end) / 2
        var prevHome = router[0]
        for i in 1..<N{
            let currentHome = router[i]
            if currentHome - prevHome >= mid{
                count += 1
                prevHome = currentHome
            }
        }
        if count < C {
            end = mid - 1
        } else{
            start = mid + 1
        }
    }
    
    return start - 1
}

let (N, C, router) = readInput()
let result = maxDistance(N: N, C: C, router: router)
print(result)