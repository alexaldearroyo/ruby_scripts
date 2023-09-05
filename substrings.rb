def substrings(string, dictionary)

  # split string into array of words
  string_array = string.split(" ")

  # create an empty hash
  result = Hash.new(0)

  # for each word in the array
  string_array.each do |word|

    # if the word is in the dictionary, add 1 to the hash
    dictionary.each do |dic_word|

      # if the word is in the dictionary, add 1 to the hash
      result[dic_word] += word.downcase.scan(dic_word).length if word.downcase.include?(dic_word)
    end
  end

  result
end
