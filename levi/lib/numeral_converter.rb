class String
  ROMAN_TO_ARABIC = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  def to_arabic_numeral
    roman_numeral = self
    total = 0
    roman_numeral.split('').each_with_index do |char, idx|
      arabic_value = ROMAN_TO_ARABIC[char]
      next_roman_numeral = roman_numeral[idx+1]
      should_add = !next_roman_numeral || ROMAN_TO_ARABIC[next_roman_numeral] <= arabic_value
      total += should_add ? arabic_value : -arabic_value
    end
    total
  end
end

class Fixnum
  ARABIC_TO_ROMAN = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }

  LEGAL_SUBTRAHENDS = [ 100, 10, 1 ]

  def to_roman_numeral
    legal_appendages = create_legal_appendages
    arabic_numeral = self
    legal_appendages.keys.sort.reverse.inject('') do |roman_numeral, current_arabic|
      roman_numeral << legal_appendages[current_arabic] * (arabic_numeral / current_arabic)
      arabic_numeral = arabic_numeral % current_arabic
      roman_numeral
    end
  end

  private

  def create_legal_appendages
    ARABIC_TO_ROMAN.inject(ARABIC_TO_ROMAN.clone) do |memo, (arabic, roman)|
      next_legal_subtrahend = next_legal_subtrahend(arabic)
      if next_legal_subtrahend
        appendage = ARABIC_TO_ROMAN[next_legal_subtrahend] + roman
        memo[arabic - next_legal_subtrahend] = appendage
      end
      memo
    end
  end

  def next_legal_subtrahend(arabic_numeral)
    LEGAL_SUBTRAHENDS.find{ |number| number < arabic_numeral }
  end

end
