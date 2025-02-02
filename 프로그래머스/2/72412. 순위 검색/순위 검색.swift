import Foundation
func solution(_ info:[String], _ query:[String]) -> [Int] {
    let dict: [String:String] = ["cpp":"0","java":"1","python":"2","backend":"0","frontend":"1","junior":"0","senior":"1","chicken":"0","pizza":"1"]
    var infoDict: [String:[Int]] = [:]
    for item in info {
        let inf = item.split(separator: " ").map { String($0) }
        var s = ""
        for i in 0..<4 {
            s += dict[inf[i],default:""]
        }
        infoDict[s,default:[]].append(Int(inf[4])!) 
    }
    for v in infoDict.keys {
        infoDict[v]!.sort { $0 > $1 }
    }
    func dfs(_ arr: [String], _ score: inout Int) {
        func backtrack(_ index: Int, _ ans: String) {
            if ans.count == 4 {
                let scores = infoDict[ans,default:[]]
                var start = 0
                var end = scores.count-1
                let target = Int(arr[4])!
                var a = 0
                while start <= end {
                    let mid = (start + end) / 2
                    if scores[mid] < target {
                        end = mid - 1
                    } else {
                        start = mid + 1 
                        a = mid + 1
                    }
                }
                score += a
                return
            }
            if arr[index] == "-" {
                backtrack(index+1,ans+"0")
                backtrack(index+1,ans+"1")
                if index == 0 {
                    backtrack(index+1,ans+"2")
                }
            } else {
                backtrack(index+1,ans+dict[arr[index],default:""])
            }
        }
        backtrack(0,"")
    }

    var result: [Int] = []
    for q in query {
        let re = q.replacingOccurrences(of:" and ",with:" ")
        let arr = re.split(separator: " ").map { String($0) }
        var score = 0
        dfs(arr,&score)
        result.append(score)
    }
    return result
}