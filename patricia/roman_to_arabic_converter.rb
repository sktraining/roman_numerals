require_relative './modules/maps'

class RomanToArabicConverter

  ROMAN_STRING_VALIDATION_ERROR = "input must be a string"
  ROMAN_INPUT_VALIDATION_ERROR = "invalid roman input"

  def initialize(roman)
    @roman = roman
  end

  def convert
    validate_roman_is_string
    @roman.upcase!
    result = 0
    Maps::ROMAN_TO_ARABIC_MAP.each do |numeral, value|
      while @roman.start_with?(numeral)
        result += value
        @roman.slice!(0..numeral.length-1)
      end
    end
    validate_valid_roman_input
    result
  end

  private

  def validate_roman_is_string
    raise ROMAN_STRING_VALIDATION_ERROR if !@roman.is_a?(String)
  end

  def validate_valid_roman_input
    raise ROMAN_INPUT_VALIDATION_ERROR if !@roman.empty?
  end
end
