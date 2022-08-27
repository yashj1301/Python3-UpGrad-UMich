import ast,sys
input_str = sys.stdin.read()
votes = ast.literal_eval(input_str)

count_votes={i:votes.count(i) for i in votes}
print(max(count_votes)) if list(count_votes.values()).count(max(count_votes.values())) == 1 else print('NOTA')