from collections import deque

def solution(maps):
    n, m = len(maps), len(maps[0])
    visited = [[[False] * 2 for _ in range(m)] for _ in range(n)]
    directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    queue = deque([(i, j, 0, 0) for i in range(n) for j in range(m) if maps[i][j] == "S"])

    for i, j, _, _ in queue:
        visited[i][j][0] = True

    while queue:
        y, x, passed_L, steps = queue.popleft()

        if maps[y][x] == "E" and passed_L:
            return steps

        for dy, dx in directions:
            ny, nx = y + dy, x + dx
            if 0 <= ny < n and 0 <= nx < m and maps[ny][nx] != "X" and not visited[ny][nx][passed_L]:
                next_passed_L = passed_L or maps[ny][nx] == "L"
                visited[ny][nx][next_passed_L] = True
                queue.append((ny, nx, next_passed_L, steps + 1))
                
    return -1
