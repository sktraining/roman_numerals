module NumeralConverter
  ROMAN_TO_ARABIC = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  def self.convert_roman_to_arabic(roman_numeral)
    total = 0
    roman_numeral.split('').each_with_index do |char, idx|
      arabic_value = ROMAN_TO_ARABIC[char]
      next_roman_numeral = roman_numeral[idx+1]
      should_add = !next_roman_numeral || ROMAN_TO_ARABIC[next_roman_numeral] <= arabic_value
      total += should_add ? arabic_value : -arabic_value
    end
    total
  end

  def self.convert_arabic_to_roman(arabic_numeral)
    roman_numeral = 'V' * (arabic_numeral / 5)
    roman_numeral += 'I' * (arabic_numeral % 5)
  end
end
