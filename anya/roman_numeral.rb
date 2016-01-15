class RomanNumeral
  ROMAN_NUM = {
              'M' => 1000,
              'CM' => 900,
              'D' => 500,
              'CD' => 400,
              'C' => 100,
              'XC' => 90,
              'L' => 50,
              'XL' => 40,
              'X' => 10,
              'IX' => 9,
              'V' => 5,
              'IV' => 4,
              'I' => 1
            }
  ROMAN_NUM.default = 0
  INT_VALUES = ROMAN_NUM.to_a.sort_by { |roman, int| -int }

  private_constant :ROMAN_NUM, :INT_VALUES

  def initialize(roman_value)
    @roman_value = roman_value.respond_to?(:upcase) ? roman_value.upcase : ""
    valid?
  end

  def to_s
    @roman_value
  end

  def int_value
    return @int_value if @int_value
    @int_value = 0
    last_char = ''
    @roman_value.each_char do |char|
      @int_value += ROMAN_NUM[char]
      if ROMAN_NUM[char] > ROMAN_NUM[last_char]
        @int_value -= (ROMAN_NUM[last_char] * 2)
      end
      last_char = char
    end
    @int_value
  end
  alias_method :to_i, :int_value

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
    fail(ArgumentError, 'invalid input') if @roman_value.match(/[^IVXLCDM]/)
  end
end
