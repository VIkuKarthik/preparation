# Design an algorithm to encode a list of strings to a string. 
# The encoded string is then sent over the network and is decoded back to the original list of strings.

# Input: ["lint","code","love","you"]
# Output: ["lint","code","love","you"]
# Explanation:
# One possible encode method is: "lint:;code:;love:;you"

# Input: ["we", "say", ":", "yes"]
# Output: ["we", "say", ":", "yes"]
# Explanation:
# One possible encode method is: "we:;say:;:::;yes"

class Enc

  def encode(data)
    data.map {|ele| ele.length.to_s+'#'+ele }.join("")
  end
  
  def decode(data)
    res = []
    pointer = 0
    str = ""
    data.chars.each_with_index do |ele, index|
      num = ele.to_i
      next if (pointer > 0) && (pointer -= 1)
      (num+2).times do |cnt|
        str += data[index+cnt] unless [0, 1].include?(cnt)
      end
      pointer = str.length+1
      res << str
      str = ""
    end
    res
  end
end

input = ["we", "say", ":", "yes"]
encoded = Enc.new.encode(input)
decoded = Enc.new.decode(encoded)

puts "Input => #{input}\nEncoded => #{encoded}\nDecoded => #{decoded}"