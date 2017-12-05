def abba?(s)
  regex_match = s.scan(/(.)(.)\2\1/)
  !regex_match.empty? && regex_match[0][0] != regex_match[0][1]
end

def ssl?(even_segments, odd_segments)
  abas = even_segments.flat_map{ |segment| segment.scan(/(?=(.)(.)\1)/) }
  babs = odd_segments.flat_map{ |segment| segment.scan(/(?=(.)(.)\1)/) }
  [abas, babs].each{ |arr| arr.delete_if{ |elem| elem[0] == elem[1] } }
  !(abas & babs.map(&:reverse)).empty?
end

tls_count = 0
ssl_count = 0
file = File.open(__dir__ + '/input.txt', 'r')
file.readlines.each do |line|
  segments = line.chomp.split(/[\[\]]/)
  even_segments = segments.values_at(*segments.each_index.select(&:even?))
  odd_segments = segments.values_at(*segments.each_index.select(&:odd?))
  if even_segments.any?{ |s| abba?(s) } && !odd_segments.any?{ |s| abba?(s) }
    tls_count += 1
  end
  ssl_count += 1 if ssl?(even_segments, odd_segments)
end

puts tls_count
puts ssl_count
