import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var dict: [Int:Double] = [:]
    var result: [(Int,Double)] = []
    for s in stages {
        dict[s-1,default:0] += 1
    }
    var cnt:Double = dict[N, default:0]
    for i in stride(from:N-1,through:0,by:-1) {
        cnt += dict[i,default: 0]
        if cnt > 0 {
            result.append((i+1,dict[i,default:0] / cnt))
        } else {
            result.append((i+1,0))
        }
    }
    let r = result.sorted {
        if $0.1 == $1.1 {
            return $0.0 < $1.0
        }
        return $0.1 > $1.1
    }
    return r.map { $0.0 }
}