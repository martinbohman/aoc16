file = File.open(__dir__ + '/input.txt', 'r')

occurences = [{}, {}, {}, {}, {}, {}, {}, {}]

file.readlines.each do |line|
  line.chomp.chars.each_with_index do |c, i|
    occurences[i][c] = occurences[i][c].to_i + 1
  end
end

max_code = ''
min_code = ''
occurences.each do |h|
  max_code += h.max_by{ |_k, v| v }[0]
  min_code += h.min_by{ |_k, v| v }[0]
end

puts max_code
puts min_code
