def phrase(string, shift)
  # Create an array of the alphabet using a range from 'a' to 'z'.
  alphabet = ("a".."z").to_a

  # Map over each character in the input string to transform it.
  string.chars.map do |char|
    # Check if the character (case-insensitive) is in the alphabet.
    if alphabet.include?(char.downcase)

      # Determine if the current character is uppercase.
      is_uppercase = char == char.upcase

      # Find the character's index, add the shift, then wrap around if necessary using modulo.
      new_char = alphabet[(alphabet.index(char.downcase) + shift) % alphabet.length]

      # If the original character was uppercase, return the new character in uppercase. Otherwise, return it in lowercase.
      is_uppercase ? new_char.upcase : new_char

    else
      # If the character is not a letter, leave it unchanged.
      char
    end

    # After transforming all characters, join them back into a string.
  end.join
end

input_string = gets.chomp
shift_amount = gets.chomp.to_i
puts "Shifted string: #{phrase(input_string, shift_amount)}"
