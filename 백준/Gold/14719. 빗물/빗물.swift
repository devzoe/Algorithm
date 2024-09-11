func readInput() -> (Int, [Int]) {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let w = line[1]
    let arr = readLine()!.split(separator: " ").map { Int($0)! }

    return (w, arr)
}

func main() {
    let (w, arr) = readInput()
    var result = 0
    for i in 1..<w-1 {
        let lMax = arr[0..<i].max()!
        let rMax = arr[i+1..<w].max()!
        let minValue = min(lMax, rMax)
        
        if minValue - arr[i] > 0 {
            result += minValue - arr[i]
        }
    }
    print(result)
}

main()