def decrypter(s, rotation)
  alphabet = Array('a'..'z')
  decryption_key = Hash[alphabet.zip(alphabet.rotate(rotation))]
  s.split('-').map do |segment|
    segment.chars.map{ |c| decryption_key[c] }.join
  end.join(' ')
end

file = File.open(__dir__ + '/input.txt', 'r')

sum = 0
file.readlines.each do |line|
  room = line.split('-')[0..-2].join('-')
  sector = line.split('-')[-1].split('[')[0]
  checksum = line.split('-')[-1].split('[')[1].delete(']').strip
  letter_counts = {}
  room.delete('-').chars.each do |c|
    letter_counts[c] = letter_counts[c].to_i + 1
  end
  sorted = letter_counts.sort_by{ |k, v| [-v, k] }
  failed = false
  checksum.chars.each_with_index do |c, j|
    failed = true unless sorted[j][0] == c
  end
  unless failed
    sum += sector.to_i
    decrypted = decrypter(room, sector.to_i)
    puts "#{decrypted}, #{sector}" if decrypted.include? 'north'
  end
end

puts sum
