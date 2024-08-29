def solution(prices):
    answer = []
    for i,p in enumerate(prices):
        check = True
        for j in range(i+1,len(prices)):
            if p > prices[j] :
                answer.append(j-i)
                check = False
                break
        if check :
            answer.append(len(prices)-i-1)
    return answer