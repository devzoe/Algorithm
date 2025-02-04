import Foundation

func check(_ n: Int, _ i: Int, _ r: Int, _ pscore: Int, _ lscore: Int, _ info: [Int], _ temp: inout [Int], _ max: inout Int, _ l: inout [Int]) {
    if i == temp.count {
        if lscore-pscore == max {
            for k in stride(from:l.count-1,through:0,by:-1) {
                if temp[k] > l[k] {
                    max = lscore-pscore
                    l = temp
                    return
                } else if temp[k] == l[k] {
                    continue
                } else {
                    return
                }
            }
        } else if lscore-pscore > max {
            max = lscore-pscore
            l = temp
        }
        return
    }
    if r+info[i]+1 > n {
        var p = 0
        if info[i] > 0 { p = 10-i }
        check(n,i+1,r,pscore+p,lscore,info,&temp,&max,&l)
    } else {
        temp[i] = info[i]+1
        check(n,i+1,r+info[i]+1,pscore,lscore+(10-i),info,&temp,&max,&l)
        temp[i] = 0
        check(n,i+1,r,pscore+(10-i),lscore,info,&temp,&max,&l)
        if info[i] == 0 {
            check(n,i+1,r,pscore,lscore,info,&temp,&max,&l)
        }
    }
}

func solution(_ n: Int, _ info: [Int]) -> [Int] {
    var max = Int.min
    var l = [Int](repeating:0,count:info.count)
    
    for i in 0..<info.count {
        var r = 0
        var pscore = 0
        for j in 0..<i { pscore += (10-i)}
        var lscore = 0
        var temp = [Int](repeating:0,count:info.count)
        check(n,i,r,pscore,lscore,info,&temp,&max,&l)
    }
    var ps = 0
    var ls = 0
    var cnt = 0
    for i in 0..<l.count {
        if l[i] > info[i] { 
            ls += 10-i 
            cnt += l[i]
        }
        else if l[i] < info[i] { ps += 10-i }
    }
    var result: [Int] = [-1]
    if ls > ps { 
        result = l 
        if n - cnt > 0 { result[result.endIndex-1] = n - cnt }
    }
    return result
}