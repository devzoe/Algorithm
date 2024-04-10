import sys
sys.setrecursionlimit(10**6)

n = int(input())

graph = [list(input()) for _ in range(n)]
visited_normal = [[False] * n for _ in range(n)]
visited_weakness = [[False] * n for _ in range(n)]

direct = [[0, 1], [1, 0], [0, -1], [-1, 0]]

def dfs(x, y, color, visited, is_weakness):
    if x < 0 or x >= n or y < 0 or y >= n or visited[x][y]:
        return False

    if is_weakness and color in 'RG':
        if graph[x][y] not in 'RG':
            return False
    elif graph[x][y] != color:
        return False
    
    visited[x][y] = True
    for dx, dy in direct:
        nx, ny = x + dx, y + dy
        dfs(nx, ny, color, visited, is_weakness)
    return True

def count_areas(visited, is_weakness):
    count = 0
    for i in range(n):
        for j in range(n):
            if not visited[i][j] and dfs(i, j, graph[i][j], visited, is_weakness):
                count += 1
    return count

count_normal = count_areas(visited_normal, False)
count_weakness = count_areas(visited_weakness, True)

print(count_normal, count_weakness)
