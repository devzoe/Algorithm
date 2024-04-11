n = int(input())
times = list(map(int, input().split()))

times.sort()
result = 0
for i in range(n):
    result += sum(times[:i+1])

print(result)

