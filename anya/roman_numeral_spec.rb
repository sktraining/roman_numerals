require_relative 'roman_numeral'

describe RomanNumeral do
  context 'when the input is nil' do
    specify { expect(described_class.new(nil).convert).to eq(0) }
  end
  context 'when the input is blank' do
    specify { expect(described_class.new('').convert).to eq(0) }
  end
  context 'when the input is invalid' do
    specify { expect { described_class.new('P').convert }.to raise_exception(ArgumentError, "invalid input") }
  end
  context 'when the input is lowercase' do
    specify { expect(described_class.new('i').convert).to eq(1) }
  end
  context 'when the input is valid' do
    specify { expect(described_class.new('I').convert).to eq(1) }
    specify { expect(described_class.new('II').convert).to eq(2) }
    specify { expect(described_class.new('III').convert).to eq(3) }
    specify { expect(described_class.new('IV').convert).to eq(4) }
    specify { expect(described_class.new('V').convert).to eq(5) }
    specify { expect(described_class.new('VI').convert).to eq(6) }
    specify { expect(described_class.new('VII').convert).to eq(7) }
    specify { expect(described_class.new('VIII').convert).to eq(8) }
    specify { expect(described_class.new('IX').convert).to eq(9) }
    specify { expect(described_class.new('X').convert).to eq(10) }
    specify { expect(described_class.new('XVI').convert).to eq(16) }
    specify { expect(described_class.new('LX').convert).to eq(60) }
    specify { expect(described_class.new('CCXXVIII').convert).to eq(228) }
    specify { expect(described_class.new('DCLXXIX').convert).to eq(679) }
    specify { expect(described_class.new('MLIV').convert).to eq(1054) }
  end
end
