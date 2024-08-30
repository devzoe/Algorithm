import Foundation

func solution(_ record:[String]) -> [String] {
    var dict: [String: String] = [:]
    var enterLeave: [[String]] = []
    var result: [String] = []
    
    for r in record {
        let line = r.split(separator: " ")
        let info: String = String(line[0])
        let uid: String = String(line[1])
        if info == "Enter" {
            let nickname: String = String(line[2])
            dict[uid] = nickname
            enterLeave.append([info, uid])
        } else if info == "Leave" {
            enterLeave.append([info, uid])
        } else {
            let nickname: String = String(line[2])
            dict[uid] = nickname
        }
    }
    
    for item in enterLeave {
        let nickname = dict[item[1]] ?? ""
        if item[0] == "Enter" {
            result.append("\(nickname)님이 들어왔습니다.")
        } else {
            result.append("\(nickname)님이 나갔습니다.")
        }
    }
    return result
}