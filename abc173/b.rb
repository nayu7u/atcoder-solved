n = gets.chomp.to_i

a = []

n.times do
    a.push(gets.chomp)
end

h = a.tally
h.default = 0

puts "AC x #{h['AC']}"
puts "WA x #{h['WA']}"
puts "TLE x #{h['TLE']}"
puts "RE x #{h['RE']}"

end
