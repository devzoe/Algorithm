import Foundation

func main() {
    guard let line1 = readLine() else { return }
    let parts1 = line1.split(separator: " ").compactMap { Int($0) }
    let n = parts1[0]
    let m = parts1[1]
    var fileSystem = [String: [(String, String)]]()

    for _ in 0..<(n + m) {
        guard let line = readLine() else { return }
        let parts = line.split(separator: " ")
        let p = String(parts[0])
        let f = String(parts[1])   
        let c = String(parts[2])   
        fileSystem[p, default: []].append((f, c))
    }
    
    func countFile(_ query: String) -> (Int, Int) {
        var queue = [String](arrayLiteral: query)
        var index = 0
        var fileNames = Set<String>()
        var totalCount = 0
        
        while index < queue.count {
            let currentFolder = queue[index]
            index += 1
            if let contents = fileSystem[currentFolder] {
                for (name, c) in contents {
                    if c == "0" {
                        totalCount += 1
                        fileNames.insert(name)
                    } else {
                        queue.append(name)
                    }
                }
            }
        }
        return (fileNames.count, totalCount)
    }
    
    guard let qLine = readLine(), let q = Int(qLine) else { return }
    for _ in 0..<q {
        guard let queryLine = readLine() else { return }
        let splitted = queryLine.split(separator: "/").map { String($0) }
        let folderName = splitted.last!
        
        let (uniqueCount, totalCount) = countFile(folderName)
        print(uniqueCount, totalCount)
    }
}

main()