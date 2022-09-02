s1=input().strip().strip('-')

res='STR' if len(['INT' for ch in s1 if ord(ch)<97 and ord(ch)>47])<len(s1) else 'INT'
print(res)