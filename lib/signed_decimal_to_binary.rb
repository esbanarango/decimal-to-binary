class SignedDecimalToBinary
  def self.convert decimal
    return '0' if decimal == 0

    # Flag if the number is negative
    negative = decimal < 0

    # Set the number to positive
    decimal = decimal.abs

    binary = ''
    while decimal != 0
      binary += (decimal % 2).to_s
      decimal /= 2
    end
    binary.reverse!
    negative ? to_negative(binary) : binary
  end

  def self.to_negative(binary)
    # Add extra byte
    binary = '0' + binary
    # Perform the NOT operand
    not_binary = binary.chars.map{|c| (c.to_i - 1).abs }.reverse

    # Sum 1
    summed_binary = not_binary
    summed_binary.each_with_index do |bit_num, index|
      summed_binary[index] = (bit_num == 1) ? 0 : 1
      break if summed_binary[index] == 1
    end

    summed_binary.reverse!

    # Remove extra byte
    summed_binary = summed_binary[1..-1] if (summed_binary[0] == 1 && summed_binary[1] == 1)

    summed_binary.join('')
  end

end