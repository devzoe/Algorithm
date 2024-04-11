n, m = map(int, input().split())  
trees = list(map(int, input().split()))  
start, end = 0, max(trees) 
result = 0
while start <= end:
    mid = (start + end) // 2  
    total = sum([tree - mid if tree > mid else 0 for tree in trees])
    if total < m:
        end = mid - 1
    else:
        result = mid
        start = mid + 1
print(result)