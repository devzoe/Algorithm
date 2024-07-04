import Foundation

func visibleBuildings(from buildingIndex: Int, heights: [Int]) -> Int {
    let n = heights.count
    var visibleCount = 0
    
    for i in 0..<n {
        if i == buildingIndex {
            continue
        }
        
        var isBlocked = false
        let slope = Double(heights[i] - heights[buildingIndex]) / Double(i - buildingIndex)
        
        for j in min(buildingIndex, i)+1..<max(buildingIndex, i) {
            let heightAtJ = Double(heights[buildingIndex]) + slope * Double(j - buildingIndex)
            if Double(heights[j]) >= heightAtJ {
                isBlocked = true
                break
            }
        }
        
        if !isBlocked {
            visibleCount += 1
        }
    }
    
    return visibleCount
}

func findBuildingWithMostVisibleBuildings(heights: [Int]) -> Int {
    let n = heights.count
    var maxVisible = 0
    
    for i in 0..<n {
        let visibleCount = visibleBuildings(from: i, heights: heights)
        if visibleCount > maxVisible {
            maxVisible = visibleCount
        }
    }
    
    return maxVisible
}
if let _ = Int(readLine()!), let heights = readLine()?.split(separator: " ").map({ Int($0)! }) {
    let result = findBuildingWithMostVisibleBuildings(heights: heights)
    print(result)
}
