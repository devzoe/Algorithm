func solution(_ scores: [[Int]]) -> Int {
    let target = scores[0]
    let sum = target.reduce(0, +)
    let sortedScores = scores.sorted { ($0[0] > $1[0]) || ($0[0] == $1[0] && $0[1] < $1[1]) }
    
    var maxCompany = 0
    var answer = 1
    
    for score in sortedScores {
        if target[0] < score[0] && target[1] < score[1] {
            return -1
        }
        
        if maxCompany <= score[1] {
            if sum < score[0] + score[1] {
                answer += 1
            }
            maxCompany = score[1]
        }
    }
    
    return answer
}