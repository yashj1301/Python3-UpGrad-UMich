text = "X-DSPAM-Confidence:    0.8475"
pos=text.find(' ')

print(float(text[pos:]))