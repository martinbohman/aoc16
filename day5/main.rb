require 'digest/md5'

input = 'reyedfim'
i = 0
found = 0
found2 = 0
password = ''
password2 = []
valid_pos = Array('0'..'7')

# this is a bit slow...
loop do
  break if found >= 8 && found2 >= 8
  digest = Digest::MD5.hexdigest(input + i.to_s)
  i += 1
  next unless digest[0..4] == '00000'
  password += digest[5]
  found += 1
  next unless valid_pos.include? digest[5]
  if password2[digest[5].to_i].nil?
    password2[digest[5].to_i] = digest[6]
    found2 += 1
  end
end

puts password[0..7]
puts password2.join('')
