func solution(_ scores:[[Int]]) -> Int {
    let target = scores[0] 
    
    let sortedScores = scores.sorted(by: { $0[0] > $1[0] || ($0[0] == $1[0] && $0[1] < $1[1]) })
    var maxScore = sortedScores.first![1]
    
    var s = [[Int]]()
    
    for score in sortedScores {
        if maxScore > score[1] {
            if score == target { return -1 }
            continue
        } else {
            s.append(score)
        }
        maxScore = max(maxScore, score[1])
    }
    
    let allScore = s.map { $0[0] + $0[1] }.sorted(by: >)

    guard let rank = allScore.firstIndex(of: target.reduce(0, +)) else {
        return -1
    }
    
    return rank + 1
}