import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var time: [Int:(String,Int)] = [:]
    for r in records {
        let l = r.split(separator:" ").map {String($0)}
        if l[2] == "IN" {
            time[Int(l[1])!,default:("",0)].0 = l[0]
        } else {
            let t1 = time[Int(l[1])!]!.0.split(separator:":").map { Int($0)! }
            let t2 = l[0].split(separator:":").map { Int($0)! }
            time[Int(l[1])!,default:("",0)].0 = ""
            time[Int(l[1])!,default:("",0)].1 += (t2[0]*60+t2[1])-(t1[0]*60+t1[1])
        }
    }
    let carNum = time.keys.sorted()
    var result:[Int] = []
    for c in carNum {
        let t = Int(c)
        if time[t]!.0 != "" {
            let s = time[t]!.0.split(separator:":").map { Int($0)! }
            time[t]!.1 += 1439-(s[0]*60+s[1])
        }
        let min = time[t]!.1
        if min <= fees[0] {
            result.append(fees[1])
        } else {
            let f = fees[1] + Int((ceil(Double(min-fees[0])/Double(fees[2]))))*fees[3]
            result.append(f)
        }
    }
    return result
}