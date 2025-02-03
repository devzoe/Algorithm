import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var d = deliveries
    var p = pickups
    var ans = 0
    var box = 0
    var i = n
    while i > 0 && d[i-1] == 0 && p[i-1] == 0 {
        d.removeLast()
        p.removeLast()
        i -= 1
    }
    var distance = n
    while d.count != 0 || p.count != 0 { 
        while(d.count != 0) {
            box += d.removeLast()
            if box > cap {
                d.append(box-cap)
                break
            }
        }
        box = 0
        while p.count != 0 {
            box += p.removeLast()
            if box > cap {
                p.append(box-cap)
                break
            }
        }
        box = 0
        ans += distance
        distance = max(d.count, p.count);
    }
    return Int64(ans*2)
}