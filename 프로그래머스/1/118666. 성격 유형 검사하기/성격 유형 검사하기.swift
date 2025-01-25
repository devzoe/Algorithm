import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var dict: [Character:Int] = [:]
    for i in 0..<survey.count {
        let c = choices[i]
        var score = 0
        var index = 0
        if c < 4 {
            index = 0
            switch c {
            case 1:
                score = 3
            case 2:
                score = 2
            case 3:
                score = 1
            default:
                break
            }
        } else if c > 4 {
            index = 1
            switch c {
            case 5:
                score = 1
            case 6:
                score = 2
            case 7:
                score = 3
            default:
                break
            }
        }
        let s = Array(survey[i])
        dict[s[index],default:0] += score
    }
    let category: [(Character,Character)] = [("R","T"),("C","F"),("J","M"),("A","N")]
    var result = ""
    for i in 0..<category.count {
        let c1 = category[i].0
        let c2 = category[i].1
        if dict[c1, default:0] >= dict[c2, default:0] {
            result += String(c1)
        } else {
            result += String(c2)
        }
    }
    
    return result
}