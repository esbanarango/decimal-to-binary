require 'spec_helper'
require_relative '../../lib/signed_decimal_to_binary.rb'

describe SignedDecimalToBinary do

  it 'converts decimals to binaries' do
    0.upto(10000) do |n|
      expect(SignedDecimalToBinary.convert(n)).to eq("%b" % n)
    end
  end

end