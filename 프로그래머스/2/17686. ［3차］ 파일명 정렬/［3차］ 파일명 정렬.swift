func solution(_ files:[String]) -> [String] {
    var arr: [[String]] = []
    var result: [String] = []
    for (f, file) in files.enumerated() {
        var nCheck = true
        var sCheck = false
        var ni = file.index(file.startIndex, offsetBy: 0)
        var nii = file.index(file.startIndex, offsetBy: 0)
        var si = file.index(file.startIndex, offsetBy: file.count-1)
        for (i,s) in file.enumerated() {
            if nCheck, let n = Int(String(s)) {
                ni = file.index(file.startIndex, offsetBy: i-1)
                nii = file.index(file.startIndex, offsetBy: i)
                nCheck = false
                sCheck = true
                continue
            }
            if sCheck && Int(String(s)) == nil {
                si = file.index(file.startIndex, offsetBy: i-1)
                break
            }
        }
        arr.append([String(file[file.startIndex...ni]),String(file[nii...si]),String(f)])
    }
    arr.sort {
        if $0[0].uppercased() == $1[0].uppercased() {
            return Int($0[1])! < Int($1[1])!
        }
        return $0[0].uppercased() < $1[0].uppercased()
    }
    for a in arr {
        result.append(files[Int(a[2])!])
    }
    return result
}