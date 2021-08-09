N, M, K = gets.chomp.split.map(&:to_i)

al = gets.chomp.split.map(&:to_i)
bl = gets.chomp.split.map(&:to_i)

# 両方のDPつくる
# index = 最大冊数
aldp = [0]
al.each do |a|
  aldp.push(a + aldp[-1])
end

bldp = [0]
bl.each do |b|
  bldp.push(b + bldp[-1])
end

bi = bldp.length - 1
max_cnt = 0
aldp.length.times do |ai|
  break if aldp[ai] > K
  while aldp[ai] + bldp[bi] > K
    bi -= 1
  end
  max_cnt = [max_cnt, ai+bi].max
end

p max_cnt
