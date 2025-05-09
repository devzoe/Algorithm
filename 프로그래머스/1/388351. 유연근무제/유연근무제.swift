import Foundation

func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    var currday = startday
    var ans = Array(repeating:true, count:schedules.count)
    for day in 0..<7 {
        for emp in 0..<schedules.count {
            if ![6,0].contains(currday%7) {
                var time = schedules[emp] + 10
                if time % 100 >= 60 {
                    time += 100
                    time -= 60
                } 
                if time < timelogs[emp][day] {
                    ans[emp] = false
                }
            }
        }
        currday += 1
    }
    
    return ans.filter{ $0 == true }.count
}