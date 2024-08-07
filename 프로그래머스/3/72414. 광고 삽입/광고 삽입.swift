import Foundation

func timeStringToSeconds(_ time: String) -> Int {
    let parts = time.split(separator: ":").map { Int($0)! }
    return parts[0] * 3600 + parts[1] * 60 + parts[2]
}

func secondsToTimeString(_ seconds: Int) -> String {
    let hours = seconds / 3600
    let minutes = (seconds % 3600) / 60
    let seconds = seconds % 60
    return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
}

func solution(_ play_time: String, _ adv_time: String, _ logs: [String]) -> String {
    let playTime = timeStringToSeconds(play_time)
    let advTime = timeStringToSeconds(adv_time)
    var totalTimes = [Int](repeating: 0, count: playTime + 1)
    
    for log in logs {
        let parts = log.split(separator: "-").map { timeStringToSeconds(String($0)) }
        let start = parts[0]
        let end = parts[1]
        totalTimes[start] += 1
        if end <= playTime {
            totalTimes[end] -= 1
        }
    }
    
    for i in 1...playTime {
        totalTimes[i] += totalTimes[i - 1]
    }
    
    var maxTime = totalTimes[0..<advTime].reduce(0, +)
    var maxStartTime = 0
    var currentSum = maxTime
    
    for i in advTime..<playTime {
        currentSum += totalTimes[i] - totalTimes[i - advTime]
        if currentSum > maxTime {
            maxTime = currentSum
            maxStartTime = i - advTime + 1
        }
    }
    
    return secondsToTimeString(maxStartTime)
}
