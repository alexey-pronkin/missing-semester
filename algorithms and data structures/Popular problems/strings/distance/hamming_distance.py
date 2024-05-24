from typing import List


# TASK:

# Дана строка s и символ c, который содержится в s.
# Необходимо вернуть массив чисел такой же длины как s,
# где каждое число равно расстоянию i-й буквы до ближайшего вхождения символа c в строке.
# Расстояние между двумя индексами в массиве i и j будем считать как |i - j|.
# Как минимум один элемент с есть в строке s

# SOLUTION:

import random
def find_nearest(s: str, c: str) -> List[int]:
    m = len(s)
    i_2 = 0
    l = [0 for i in range(m)] 
    indexes = []
    
    for i in range(m):
        if s[i] == c:
            # l[i] = 0
            # print(i)
            indexes.append(i)
    l[0] = indexes[0]
    k = len(indexes)
    for i in range(1, m):
        if i <= indexes[i_2]:
            l[i] = l[i-1] - 1
        elif k > i_2 + 1: 
            p = (indexes[i_2] + indexes[i_2+1]) / 2
            if i < p:
                l[i] = l[i-1] + 1
            if i == p:
                i_2 += 1
                l[i] = l[i-1] + 1
            elif i > p:
                i_2 += 1
                l[i] = l[i-1]
        else:
            l[i] = l[i-1] + 1
    return l
# Кейсы: 
# One element
s = "j"
c = "j"
assert find_nearest(s=s, c=c) == [0]
s = "sgtjtyjdgj"
c = "j"
p = [0,1,2,3,4,5,6,7,8,9] # Индексы для удобства
l = [3,2,1,0,1,1,0,1,1,0]
assert find_nearest(s=s, c=c) == l

#  Ошибка была в том, что при равенстве не переключал на следующий индекс