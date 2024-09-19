import Foundation

func strToInt(_ time: String) -> Int {
    let components = time.split(separator: ":").map { Int($0)! }
    return components[0] * 3600 + components[1] * 60 + components[2]
}

func intToStr(_ time: Int) -> String {
    let h = time / 3600
    let m = (time % 3600) / 60
    let s = time % 60
    return String(format: "%02d:%02d:%02d", h, m, s)
}

func solution(_ play_time: String, _ adv_time: String, _ logs: [String]) -> String {
    let playTime = strToInt(play_time)
    let advTime = strToInt(adv_time)
    var allTime = [Int](repeating: 0, count: playTime + 1)
    
    for log in logs {
        let times = log.split(separator: "-").map { String($0) }
        let start = strToInt(times[0])
        let end = strToInt(times[1])
        allTime[start] += 1
        if end <= playTime { 
            allTime[end] -= 1
        }
    }
    
    for i in 1..<allTime.count {
        allTime[i] += allTime[i - 1]
    }
    
    for i in 1..<allTime.count {
        allTime[i] += allTime[i - 1]
    }
    
    var mostView = 0
    var maxTime = 0
    for i in advTime - 1..<playTime {
        let currentView = allTime[i] - (i >= advTime ? allTime[i - advTime] : 0)
        if currentView > mostView {
            mostView = currentView
            maxTime = i - advTime + 1
        }
    }

    return intToStr(maxTime)
}
