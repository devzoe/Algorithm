import Foundation

var result = [0, 0]

func check(_ arr:[[Int]], _ x: Int, _ y: Int, _ l: Int) {
    var start = arr[x][y]
    var flag = true

    loop: for i in x..<x+l {
        for j in y..<y+l{
            if(start != arr[i][j]) {
                flag = false
                break loop
            }
        }
    }
    
    if flag {
        result[start] += 1
        return
    }
    
    let h = l / 2
    check(arr, x, y, h)
    check(arr, x + h, y, h)
    check(arr, x, y + h, h)
    check(arr, x + h, y + h, h)
}

func solution(_ arr:[[Int]]) -> [Int] {
    result = [0, 0]
    check(arr, 0, 0, arr.count)
    return result
}
