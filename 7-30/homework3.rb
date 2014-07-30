def num_of_letters message
  message.split("").inject(Hash.new(0)) do |count_hash, letters|
    count_hash[letters] += 1
    count_hash
  end
end

def letter_counter letter, message
  letter_count = num_of_letters message
  letter_count[letter]
end
