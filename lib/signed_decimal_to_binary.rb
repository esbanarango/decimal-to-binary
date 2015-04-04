class SignedDecimalToBinary
  def self.convert decimal
    return '0' if decimal == 0
    binary = ''
    while decimal != 0
      binary += (decimal % 2).to_s
      decimal /= 2
    end
    binary.reverse
  end
end