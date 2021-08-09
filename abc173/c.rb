h, w, k = gets.chomp.split.map(&:to_i)

f = []
h.times do
  f.push(gets.chomp.chars)
end

total = 0
hcnt = []
f.each do |fi|
  temp = fi.tally
  temp.default = 0
  hcnt.push(temp["#"])
end
total = hcnt.sum

wcnt = []
(w).times do |wi|
  wtemp = 0
  (h).times do |hi|
    wtemp += 1 if f[hi][wi] == '#'
  end
  wcnt.push(wtemp)
end

cnt = 0
# 2^(h+w) loop
# status = (hhhhhwwwww)_2
(2**(h+w)).times do |s|
  # sからbitが立っている桁を取る
  black = total
  h_i = []
  w_i = []
  (h+w).times do |i|
    if s & 2**i == 2**i
      if i < w
        black -= wcnt[i]
        w_i.push(i)
      else
        black -= hcnt[i-w-1]
        h_i.push(i-w-1)
      end
    end
  end

  prod = h_i.product(w_i)
  prod.each do |hi, wi|
    black += 1 if f[hi][wi] == '#'
  end
  cnt += 1 if black == k
end

p cnt
