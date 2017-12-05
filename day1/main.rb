input = %w(
  L1 L5 R1 R3 L4 L5 R5 R1 L2 L2 L3 R4 L2 R3 R1 L2 R5 R3 L4 R4 L3 R3 R3
  L2 R1 L3 R2 L1 R4 L2 R4 L4 R5 L3 R1 R1 L1 L3 L2 R1 R3 R2 L1 R4 L4 R2 L189 L4
  R5 R3 L1 R47 R4 R1 R3 L3 L3 L2 R70 L1 R4 R185 R5 L4 L5 R4 L1 L4 R5 L3 R2 R3
  L5 L3 R5 L1 R5 L4 R1 R2 L2 L5 L2 R4 L3 R5 R1 L5 L4 L3 R4 L3 L4 L1 L5 L5 R5 L5
  L2 L1 L2 L4 L1 L2 R3 R1 R1 L2 L5 R2 L3 L5 L4 L2 L1 L2 R3 L1 L4 R3 R3 L2 R5 L1
  L3 L3 L3 L5 R5 R1 R2 L3 L2 R4 R1 R1 R3 R4 R3 L3 R3 L5 R2 L2 R4 R5 L4 L3 L1 L5
  L1 R1 R2 L1 R3 R4 R5 R2 R3 L2 L1 L5
)

dirs = [
  [0, 1],  # N
  [1, 0],  # E
  [0, -1], # S
  [-1, 0]  # W
]

# start north
dir = 0
pos = [0, 0]
visited = []
visited.push([0, 0])
first_twice = nil
input.each do |inp|
  turn = inp[0]
  dist = inp[1..-1].to_i
  if turn == 'L'
    dir -= 1
  else
    dir += 1
  end
  start_pos = pos.clone
  pos[0] += dirs[dir % 4][0] * dist
  pos[1] += dirs[dir % 4][1] * dist
  (start_pos[0]..pos[0]).each do |x|
    (start_pos[1]..pos[1]).each do |y|
      unless [x, y] == start_pos || [x, y] == pos
        first_twice = [x, y] if first_twice.nil? && visited.include?([x, y])
        visited.push([x, y])
      end
    end
  end
  visited.push(pos)
end

puts pos[0].abs + pos[1].abs
puts first_twice[0].abs + first_twice[1].abs
