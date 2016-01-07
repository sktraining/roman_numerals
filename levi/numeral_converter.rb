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

  ARABIC_TO_ROMAN = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }

  def self.convert_arabic_to_roman(arabic_numeral)
    ARABIC_TO_ROMAN.keys.sort.reverse.inject('') do |roman_numeral, current_arabic|
      roman_numeral += ARABIC_TO_ROMAN[current_arabic] * (arabic_numeral / current_arabic)
      arabic_numeral = arabic_numeral % current_arabic
      roman_numeral
    end
  end
end
