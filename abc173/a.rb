n = gets.chomp.to_i

otsuri = 10000 - n

while otsuri - 1000 >= 0
  otsuri -= 1000
end

p otsuri
