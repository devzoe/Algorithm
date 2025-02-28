import Foundation

func find(_ dict: inout [String:String], _ x: String) -> String {
    if dict[x] ?? "" != x { dict[x] = find(&dict,dict[x]!) }
    return dict[x] ?? ""
}

func union(_ dict: inout [String:String], _ x: String, _ y: String, _ dist: inout [String:Int]) -> Int {
    var cnt = 0
    let rootX = find(&dict,x)
    let rootY = find(&dict,y)
    if rootX == rootY { return dist[rootX]! }
    if dist[rootX]! >= dist[rootY]! {
        dict[rootY] = rootX
        dist[rootX]! += dist[rootY]!
        cnt = dist[rootX]!
    } else {
        dict[rootX] = rootY
        dist[rootY]! += dist[rootX]!
        cnt = dist[rootY]!
    }
    return cnt
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var friendDict: [String:String] = [:]
    var distDict: [String:Int] = [:]
    for _ in 0..<n {
        let f = readLine()!.split(separator: " ").map { String($0) }
        if friendDict[f[0]] == nil {
            friendDict[f[0]] = f[0]
            distDict[f[0]] = 1
        }
        if friendDict[f[1]] == nil {
            friendDict[f[1]] = f[1]
            distDict[f[1]] = 1
        }
        let ans = union(&friendDict, f[0], f[1], &distDict)
        print(ans)
    }
}