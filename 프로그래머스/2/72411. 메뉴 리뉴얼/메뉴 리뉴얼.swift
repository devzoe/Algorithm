import Foundation

func combinations<T>(_ elements: [T], _ k: Int) -> [[T]] {
    if k == 0 { return [[]] }
    if elements.isEmpty { return [] }
    
    let head = elements[0]
    let subcomb = combinations(Array(elements[1...]), k - 1)
    let headComb = subcomb.map { [head] + $0 }
    
    return headComb + combinations(Array(elements[1...]), k)
}

func solution(_ orders: [String], _ course: [Int]) -> [String] {
    var answer: [String] = []
    var menu: [String: Int] = [:]
    
    for order in orders {
        let sortedOrder = Array(order).sorted()
        for cour in course {
            let combis = combinations(sortedOrder, cour)
            for combi in combis {
                let menuItem = String(combi)
                menu[menuItem, default: 0] += 1
            }
        }
    }
    
    for c in course {
        let filteredMenu = menu.filter { $0.key.count == c }
        let maxCount = filteredMenu.values.max() ?? 0
        if maxCount >= 2 {
            let popularMenus = filteredMenu.filter { $0.value == maxCount }.keys
            answer.append(contentsOf: popularMenus)
        }
    }
    
    return answer.sorted()
}