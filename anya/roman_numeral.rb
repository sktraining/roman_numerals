class RomanNumeral
  ROMAN_NUM = {
              'M' => 1000,
              'D' => 500,
              'C' => 100,
              'L' => 50,
              'X' => 10,
              'V' => 5,
              'I' => 1
            }
  ROMAN_NUM.default = 0
  INT_VALUES = ROMAN_NUM.to_a.sort_by { |roman, int| -int }

  def initialize(number)
    @number = number.respond_to?(:upcase) ? number.upcase : ""
    valid?
  end

  def to_s
    @number 
  end

  def convert
    running_total = 0
    last_char = ''
    @number.each_char do |char|
      running_total += ROMAN_NUM[char]
      if ROMAN_NUM[char] > ROMAN_NUM[last_char]
        running_total -= (ROMAN_NUM[last_char] * 2)
      end
      last_char = char
    end
    running_total
  end

  def self.from_i(int)
    if int
      roman_answer = ''
      INT_VALUES.each do |roman, value|
        roman_answer << roman * (int/value)
        int = int % value 
      end
      roman_answer
    else
      nil
    end
  end

  private

  def valid?
    fail(ArgumentError, 'invalid input') if @number.match(/[^IVXLCDM]/)
  end
end
