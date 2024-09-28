import Foundation


func combination(_ cnt: Int, _ i: Int, _ min: Int, _ max: Int, _ ans: [Int], _ arr: inout [[Int]]) {
    if i == cnt {
        arr.append(ans)
        return
    }     
    for next in stride(from:min,through:max,by:10) {
        var nextAns = ans + [next]
        combination(cnt,i+1,min,max,nextAns,&arr)     
    }
}

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var result = [0,0]
    var maxPer = 0
    var minPer = 41
    for user in users {
        maxPer = max(user[0], maxPer)
        minPer = min(user[0], minPer)
    }
    maxPer = Int(ceil(Double(maxPer)/10) * 10)
    minPer = Int(ceil(Double(minPer)/10) * 10)
    
    var cnt = emoticons.count
    var ans: [Int] = []
    var per: [[Int]] = []
    
    combination(cnt,0,minPer,maxPer,ans,&per) 
    
    for p in per {
        var plus = 0
        var total = 0
        
        for user in users {
            var cost = 0

            for (i, e) in emoticons.enumerated() {
                if p[i] >= user[0] {
                    cost += e * (100 - p[i]) / 100
                }
            } 

            if cost >= user[1] {
                plus += 1
            } else {
                total += cost
            }
        }
        

        if plus > result[0] || (plus == result[0] && total > result[1]) {
            result = [plus, total]
        } 
    }

    return result
}