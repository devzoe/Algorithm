import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    let video = video_len.split(separator: ":").map { Int($0)!} 
    let videoTime = video[0]*60 + video[1]
    let pos = pos.split(separator: ":").map { Int($0)!} 
    var curr = pos[0]*60 + pos[1]
    let op_s = op_start.split(separator: ":").map { Int($0)!} 
    let op_start = op_s[0]*60 + op_s[1]
    let op_e = op_end.split(separator: ":").map { Int($0)!} 
    let op_end = op_e[0]*60 + op_e[1]
    for cmd in commands {
        if op_start <= curr && curr <= op_end {
            curr = op_end
        }
        if cmd == "next" {
            curr += 10
            if videoTime < curr {
                curr = videoTime
            }
        } else {
            curr -= 10
            if curr < 0 {
                curr = 0
            }
        }
        if op_start <= curr && curr <= op_end {
            curr = op_end
        }
    }
    let min = curr / 60
    let sec = curr % 60
    return (min < 10 ? "0\(min)" : "\(min)") + (sec < 10 ? ":0\(sec)" : ":\(sec)" )
}