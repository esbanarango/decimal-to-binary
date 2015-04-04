require 'spec_helper'
require_relative '../../lib/signed_decimal_to_binary.rb'

describe SignedDecimalToBinary do

  describe '.convert' do
    context 'when the decimal is positive' do
      it 'converts a decimal to a binary' do
        0.upto(1_00_000) do |n|
          expect(SignedDecimalToBinary.convert(n)).to eq("%b" % n)
        end
      end
    end
    context 'when the decimal is negative' do
      it 'converts a decimal to a binary' do
        1.upto(1_00_000) do |n|
          expect(SignedDecimalToBinary.convert(-n)).to eq ("%b" % (n*-1))[2..-1]
        end
      end
    end
  end

  describe '.to_negative' do
    it 'converts a binary string to its negative representation' do
      1.upto(1_00_000) do |n|
        expect(SignedDecimalToBinary.to_negative("%b" % n)).to eq ("%b" % (n*-1))[2..-1]
      end
    end
  end

end