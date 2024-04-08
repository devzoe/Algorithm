from collections import deque
from enum import Enum

class Direction(Enum):
    UP = 1
    DOWN = 2
    LEFT = 3
    RIGHT = 4
def solution(board):
    nx = len(board[0])
    ny = len(board)
    path = [[0,1],[-1,0],[0,-1],[1,0]]
    costs = [[float("inf")] * nx for _ in range(ny)]
    visited = [[0] * nx for _ in range(ny)]
    result = []
    def dfs(x, y, cost, currDirection):
        if cost > costs[x][y] + 400:
            return
        
        costs[x][y] = cost
        if x == nx-1 and y == ny-1:
            result.append(costs[x][y])
            return
        visited[x][y] = 1
        
        for p in path:        
            if x+p[0] < 0 or x+p[0] >= nx or y+p[1] < 0 or y+p[1] >= ny:
                continue
            if board[x+p[0]][y+p[1]]:
                continue
            if not visited[x+p[0]][y+p[1]]:
                if p[1]:
                    direction = Direction.UP
                elif p[1] == -1:
                    direction = Direction.DOWN
                elif p[0]:
                    direction = Direction.RIGHT
                elif p[0] == -1:
                    direction = Direction.LEFT
                cost = costs[x][y] + 100
                if currDirection is not None:
                    if currDirection != direction:
                        cost += 500
                dfs(x+p[0],y+p[1],cost,direction)
        visited[x][y] = 0
    dfs(0,0,0,None)
    return min(result)