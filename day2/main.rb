# --- part 1 ---
# 1 2 3         2
# 4 5 6         1
# 7 8 9         0 1 2

moves = {
  U: [0, 1],
  D: [0, -1],
  R: [1, 0],
  L: [-1, 0]
}

pos = [1, 1] # number 5 in 3x3 grid with

numbers = []
file = File.open(__dir__ + '/input.txt', 'r')
file.readlines.each do |line|
  line.chomp.each_char do |char|
    move = moves[char.to_sym]
    pos[0] = [[pos[0] + move[0], 0].max, 2].min
    pos[1] = [[pos[1] + move[1], 0].max, 2].min
  end
  numbers.push(pos.clone)
end

grid = [
  [7, 4, 1],
  [8, 5, 2],
  [9, 6, 3]
]
code = ''
numbers.each do |x, y|
  code += grid[x][y].to_s
end

puts code

file.close

# --- part 2 ---
valid_positions = [
  [-1, 1],
  [0, 0],  [0, 1], [0, 2],
  [1, -1], [1, 0], [1, 1], [1, 2], [1, 3],
  [2, 0],  [2, 1], [2, 2],
  [3, 1]
]

pos = [1, 1] # number 5 in 3x3 grid with

file = File.open(__dir__ + '/input.txt', 'r')
numbers = []
file.readlines.each do |line|
  line.chomp.each_char do |char|
    move = moves[char.to_sym]
    new_pos = []
    new_pos[0] = pos[0] + move[0]
    new_pos[1] = pos[1] + move[1]
    pos = new_pos.clone if valid_positions.include? new_pos
  end
  numbers.push(pos.clone)
end

grid = [
  ['A', 6, 2],
  ['B', 7, 3, 1, 'D'],
  ['C', 8, 4],
  [nil, 9],
  [nil, 5]
]

code = ''
numbers.each do |x, y|
  code += grid[x][y].to_s
end

puts code

file.close
