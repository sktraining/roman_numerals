require_relative '../modules/maps'

class ArabicToRomanConverter
  POSITIVE_INTEGER_VALIDATION_ERROR = "input must be a positive integer"

  def initialize(arabic)
    @arabic = arabic
  end

  def convert
    validate_arabic_is_positive_integer
    result = ""
    Maps::ROMAN_TO_ARABIC_MAP.each do |numeral, value|
      result << numeral * (@arabic / value)
      @arabic = @arabic % value
    end
    result
  end

  private

  def validate_arabic_is_positive_integer
    raise POSITIVE_INTEGER_VALIDATION_ERROR if (!@arabic.is_a?(Integer) || @arabic < 1 )
  end
end
