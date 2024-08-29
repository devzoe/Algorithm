def solution(prices):
    answer = [0 for _ in range(len(prices))]
    stack = []
    for i,p in enumerate(prices):
        while True:
            if stack and stack[-1][1] > p:
                curr_i, curr_p = stack.pop()
                answer[curr_i] = i-curr_i
            else:
                break
        stack.append([i,p])
    for s in stack:
        answer[s[0]] = len(prices)-(s[0]+1)
            
    return answer