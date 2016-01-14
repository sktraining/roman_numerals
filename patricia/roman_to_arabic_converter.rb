class RomanToArabicConverter

  ROMAN_TO_ARABIC_MAP = {
    "M"=>1000,
    "CM"=>900,
    "D"=>500,
    "CD"=>400,
    "C"=>100,
    "XC"=>90,
    "L"=>50,
    "XL"=>40,
    "X"=>10,
    "IX"=>9,
    "V"=>5,
    "IV"=>4,
    "I"=>1
  }

  def initialize(roman)
    @roman = roman
  end

  def convert
    raise "input must be a string" if !@roman.is_a?(String)
    result = 0
    ROMAN_TO_ARABIC_MAP.each do |numeral, value|
      while @roman.start_with?(numeral)
        result += value
        @roman.slice!(0..numeral.length-1)
      end
    end
    raise "invalid roman input" if !@roman.empty?
    result
  end
end
