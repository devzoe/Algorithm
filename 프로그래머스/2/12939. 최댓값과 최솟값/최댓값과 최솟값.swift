func solution(_ s: String) -> String {
    let list1 = s.split(separator: " ").compactMap { Int($0) }

    if let minValue = list1.min(), let maxValue = list1.max() {
        return "\(minValue) \(maxValue)"
    } else {
        return ""
    }
}
