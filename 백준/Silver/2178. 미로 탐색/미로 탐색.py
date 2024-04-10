from collections import deque

n, m = map(int, input().split())
maze = [list(map(int, input())) for _ in range(n)]
direction = [(0, -1), (-1, 0), (0, 1), (1, 0)]

visited = [[0] * m for _ in range(n)]
visited[0][0] = 1

def bfs():
    queue = deque([(0, 0)])
    while queue:
        x, y = queue.popleft()
        if x == n - 1 and y == m - 1: 
            return visited[x][y]
        for dx, dy in direction:
            nx, ny = x + dx, y + dy
            if 0 <= nx < n and 0 <= ny < m and maze[nx][ny] == 1 and visited[nx][ny] == 0:
                visited[nx][ny] = visited[x][y] + 1
                queue.append((nx, ny))
print(bfs())