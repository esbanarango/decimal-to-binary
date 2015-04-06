class DecimalToBinary

  attr_accessor :negative_base

  def initialize(negative_base = false)
    @negative_base = negative_base
  end

  def convert decimal
    return '0' if decimal == 0

    if @negative_base
      with_negative_base decimal
    else
      with_positive_base decimal
    end
  end

  def to_negative(binary)
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

  private

  def with_positive_base decimal

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

  def with_negative_base decimal

    number_of_terms = (Math.log2(decimal.abs)).ceil + 2
    binary_array = Array.new(number_of_terms, 0)
    binary_array[0] = decimal % 2
    min = decimal
    for i in 0..(number_of_terms-2)
      binary_array[i+1] = ((min - binary_array[i])/-2) % 2
      min = ((min - binary_array[i])/-2)
    end

    # Remove extra byte
    while binary_array[binary_array.length - 1] == 0
      binary_array = binary_array[0..-2]
    end
    binary_array.reverse!.join('')

  end


end