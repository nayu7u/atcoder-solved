def f(x, k, a, l)
  cnt = 0
  before_ai = 0
  a.each do |ai|
    if x <= ai - before_ai
      before_ai = ai
      cnt += 1
    end

    # cnt == kとなったときに残りの長さがx以上であれば、xは解に成り得る
    break if cnt == k
  end

  # cntがk未満の場合はk+1個に分割できていないのでfalse
  return false if cnt < k


  # k+1個目がx以上の大きさであれば、分割可能
  return (l - before_ai) >= x ? true : false
end

n, l = gets.split.map(&:to_i)
k = gets.to_i
a = gets.split.map(&:to_i)

# -l..0 で二分探索(rubyのbsearchはfind-minなため)
max = 0
(-l..0).bsearch do |minus_x|
  x = -minus_x
  if f(x, k, a, l)
    max = x
    true
  else
    false
  end
end

p max
