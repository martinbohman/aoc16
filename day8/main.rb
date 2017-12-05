def get_column(screen, num)
  screen.map{ |row| row[num] }
end

def set_column(screen, num, arr)
  screen.each_with_index{ |row, i| row[num] = arr[i] }
end

def turn_on_pixels(screen, wide, tall)
  (0..tall - 1).each do |row|
    (0..wide - 1).each do |col|
      screen[row][col] = '#'
    end
  end
end

def output(screen)
  screen.each{ |row| puts row.join(' ') }
end

screen = []
6.times do |i|
  screen[i] = [' '] * 50
end

file = File.open(__dir__ + '/input.txt', 'r')
file.readlines.each do |line|
  parts = line.chomp.split(' ')
  if parts[0] == 'rect'
    turn_on_pixels(screen, *parts[1].split('x').map(&:to_i))
  else
    row_or_col = parts[2].split('=')[1].to_i
    rotation = parts[4].to_i
    if parts[1] == 'row'
      screen[row_or_col] = screen[row_or_col].rotate(-rotation)
    else
      set_column(
        screen,
        row_or_col,
        get_column(screen, row_or_col).rotate(-rotation)
      )
    end
  end
end
sum = 0
screen.flatten.each do |elem|
  sum += 1 if elem == '#'
end
output(screen)
puts sum
