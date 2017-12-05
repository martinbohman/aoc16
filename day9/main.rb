file = File.open(__dir__ + '/input.txt', 'r')

compressed = file.readline
decompressed = ''
compressed_length = compressed.length
i = 0
loop do
  break if i >= compressed_length
  parts = compressed[i..-1].split('(')
  decompressed += parts[0]
  if parts[1]
    marker = parts[1].split(')')[0]
    num_chars = marker.split('x')[0].to_i
    repeat = marker.split('x')[1].to_i
    rest = compressed[(i + parts[0].length + marker.length + 2)..-1]
    decompressed += rest[0..(num_chars - 1)] * repeat
    i += marker.length + num_chars + 2 # ( ) removed
  end
  i += parts[0].length
end
puts decompressed.length
file.close

# --- part 2 ---

def decomp_len(s)
  marker_index = s.index('(')
  if marker_index
    num_chars = s[(marker_index + 1)..(s.index('x') - 1)].to_i
    repeat = s[(s.index('x') + 1)..s.index(')') - 1].to_i
    marker_index +
      decomp_len(s[(s.index(')') + 1)..(s.index(')') + num_chars)]) * repeat +
      decomp_len(s[(s.index(')') + num_chars + 1)..-1])
  else
    s.length
  end
end
puts decomp_len(compressed)
