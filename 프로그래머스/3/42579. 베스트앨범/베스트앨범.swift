import Foundation

func solution(_ genres: [String], _ plays: [Int]) -> [Int] {
    var answer = [Int]()
    var genrePlayCount = [String: Int]()
    var genreSongs = [String: [(Int, Int)]]()

    for (i, (g, p)) in zip(genres, plays).enumerated() {
        genrePlayCount[g, default: 0] += p
        genreSongs[g, default: [(Int, Int)]()].append((i, p))
    }
    
    let sortedGenres = genrePlayCount.sorted { $0.value > $1.value }
    
    for (g, _) in sortedGenres {
        if let arr = genreSongs[g] {
            let sortedArr = arr.sorted { 
                if $0.1 == $1.1 {
                    return $0.0 < $1.0
                } else {
                    return $0.1 > $1.1
                }
            }
            answer.append(contentsOf: sortedArr.prefix(2).map { $0.0 })
        }
    }
    
    return answer
}

