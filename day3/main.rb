# --- part 1 ---
file = File.open(__dir__ + '/input.txt', 'r')
count = 0
file.readlines.each do |line|
  arr = line.gsub('    ', '  ').gsub('   ', '  ').strip.split('  ')
            .map(&:to_i).sort
  count += 1 if arr[0] + arr[1] > arr[2]
end
puts count
file.close

# --- part 2 ---
file = File.open(__dir__ + '/input.txt', 'r')
count = 0
until file.eof?
  lines = []
  3.times do
    lines.push(
      file.readline.gsub('    ', '  ').gsub('   ', '  ').strip.split('  ')
        .map(&:to_i)
    )
  end
  new_triangles = []
  (0..2).each do |num|
    new_triangles.push([lines[0][num], lines[1][num], lines[2][num]])
  end
  new_triangles.map(&:sort).each do |arr|
    count += 1 if arr[0] + arr[1] > arr[2]
  end
end
puts count
file.close
