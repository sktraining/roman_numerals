module RomanNumerals
  ROMAN_NUMERALS = {
    'I' => 1,
    'V' => 5,
    'X' => 10
  }

  def self.convert_roman_to_arabic(roman_numeral)
    total = 0
    roman_numeral.split('').each_with_index do |char, idx|
      arabic_value = ROMAN_NUMERALS[char]
      next_roman_numeral = roman_numeral[idx+1]
      if next_roman_numeral && ROMAN_NUMERALS[next_roman_numeral] > arabic_value
        total -= arabic_value
      else
        total += arabic_value
      end
    end
    total
  end
end
