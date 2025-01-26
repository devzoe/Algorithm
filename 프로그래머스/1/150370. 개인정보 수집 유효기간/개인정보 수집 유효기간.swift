import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var term: [String:Int] = [:]
    var ymd = today.split(separator:".").map {Int($0)!}
    var result: [Int] = []
    for t in terms {
        let s = t.split(separator:" ")
        term[String(s[0])] = Int(String(s[1]))!
    }
    for (i,p) in privacies.enumerated() {
        let s = p.split(separator:" ")
        var c = s[0].split(separator:".").map{Int($0)!}
        let ct = c[1] + term[String(s[1]),default:0]
        let year = ct / 12
        let month = ct % 12
        c[0] += year
        c[1] = month
        if month == 0 { 
            c[0] -= 1
            c[1] = 12 
        }
        if c[2] == 1 {
            c[2] = 28
            if c[1] == 1 {
                c[1] = 12
                c[0] -= 1
            } else {
                c[1] -= 1
            }
        } else {
            c[2] -= 1
        }
        if c[0] == ymd[0] {
            if c[1] == ymd[1] {
                if c[2] < ymd[2] {
                    result.append(i+1)
                }
            } else if c[1] < ymd[1] {
                result.append(i+1)
            }
        } else if c[0] < ymd[0] {
            result.append(i+1)
        }
    }
    return result
}