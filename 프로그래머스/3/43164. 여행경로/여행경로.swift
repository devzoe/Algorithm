// 시간복잡도 줄여서 성공한 코드
func solution(_ tickets:[[String]]) -> [String] {
    
    var result = [String]()
    let total = tickets.count
    
    // 1. 그래프 생성
    var graph = [String: [String]]()
    for ticket in tickets {
        graph[ticket[0], default: []].append(ticket[1])
    }
    
    // 우선순위 정렬하기
    for (k,v) in graph {
        graph[k] = graph[k]!.sorted()
    }
    
    var flag = false
    
    func backtracking(_ cur_country: String, _ ans: [String]) {
        if flag {
            return
        }
        
        if ans.count == total + 1 {
            result = ans
            flag = true
            return
        }
            
        let country_list = graph[cur_country, default: []]
        if country_list.count == 0 { return }
        
        var temp = [String]()
        temp = country_list
        
        for (i, next_country) in temp.enumerated() {
            var next_country = temp[i]
            temp.remove(at: i)
            graph[cur_country] = temp
            
            backtracking(next_country, ans + [next_country])
            
            temp = country_list
            graph[cur_country] = temp
        }
    }
    
    backtracking("ICN", ["ICN"])
    
    return result
}