# Example
# Input: s = "anagram", t = "nagaram"
# Output: true

# Example
# Input: s = "rat", t = "car"
# Output: false


# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false unless s.length == t.length
  lookup_s = {}
  lookup_t = {}
  s.chars.each do |s_char|
    lookup_s.has_key?(s_char) ? lookup_s[s_char] += 1 : lookup_s[s_char] = 0
  end
  
  t.chars.each do |t_char|
    lookup_t.has_key?(t_char) ? lookup_t[t_char] += 1 : lookup_t[t_char] = 0
  end
  
  lookup_s.each do |key, value|
    return false unless lookup_t.has_key?(key)
    return false if lookup_s[key] > lookup_t[key] || lookup_t[key] > lookup_s[key]
  end
  return true
end

puts is_anagram('is_anagram', 'is_anagram')
puts is_anagram('rat', 'cat')


# SIMPLE

def min_steps(s, t)
  hash = Hash.new(0)

  s.each_char {|char| hash[char] += 1}
  t.each_char {|char| hash[char] -= 1 if hash[char] > 0}

  sum = 0
  hash.each {|k, v| sum += v}
  return true if sum == 0
end

puts min_steps('is_anagram', 'is_anagram')
puts min_steps('rat', 'cat')