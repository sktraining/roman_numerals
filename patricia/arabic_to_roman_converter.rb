class ArabicToRomanConverter
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

  def initialize(arabic)
    @arabic = arabic
  end

  def convert
    raise "input must be a positive integer" if (!@arabic.is_a?(Integer) || @arabic < 1 )
    result = ""
    ROMAN_TO_ARABIC_MAP.each do |numeral, value|
      result << numeral * (@arabic / value)
      @arabic = @arabic % value
    end
    result
  end
end
