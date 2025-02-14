func solution(_ m:String, _ musicinfos:[String]) -> String {
    var result:[(Int,String)] = []
    let dict = ["C#":"0","D#":"1","F#":"2","G#":"3","A#":"4"]
    var mm = m
    for d in dict.keys {
        if m.contains(d) {
            mm = mm.replacingOccurrences(of:d,with:dict[d]!)
        }
    }
    for music in musicinfos {
        let temp = music.split(separator: ",").map { String($0) }
        let s = temp[0].split(separator:":").map { Int($0)! }
        let e = temp[1].split(separator:":").map { Int($0)! }
        let start = s[0]*60 + s[1]
        let end = e[0]*60 + e[1]
        let playTime = end - start
        if playTime == 0 { continue }
        var play = ""
        let l = temp[3].count
        let t3 = temp[3].map { String($0) }
        var time = 0
        var i = 0 
        while time < playTime {
            play += t3[i%l]
            i += 1
            if t3[i%l] != "#" { 
                 time += 1
            }
        }
        for d in dict.keys {
            if play.contains(d) {
                play = play.replacingOccurrences(of:d,with:dict[d]!)
            }
        }
        if play.contains(mm) {
            result.append((playTime,temp[2]))
        }
    }
    if result.isEmpty { return "(None)" }
    result.sort {
        return $0.0 > $1.0
    }
    return result[0].1
}