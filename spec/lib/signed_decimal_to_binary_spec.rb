require 'spec_helper'
require_relative '../../lib/signed_decimal_to_binary.rb'

describe SignedDecimalToBinary do

  let(:to_limit) { 1_00_000 }

  describe '.convert' do
    context 'when the decimal is positive' do
      it 'converts a decimal to a binary' do
        0.upto(to_limit) do |n|
          expect(SignedDecimalToBinary.convert(n)).to eq("%b" % n)
        end
      end
    end
    context 'when the decimal is negative' do
      it 'converts a decimal to a binary' do
        1.upto(to_limit) do |n|
          expect(SignedDecimalToBinary.convert(-n)).to eq ("%b" % (n*-1))[2..-1]
        end
      end
    end
  end

  describe '.to_negative' do
    it 'converts a binary string to its negative representation' do
      1.upto(to_limit) do |n|
        expect(SignedDecimalToBinary.to_negative("%b" % n)).to eq ("%b" % (n*-1))[2..-1]
      end
    end
  end

  describe '.convert_with_neg_base' do
    it 'converts a decimal to binary with negative base' do
      expect(SignedDecimalToBinary.convert_with_neg_base(-9)).to eq ('1101')
      expect(SignedDecimalToBinary.convert_with_neg_base(9)).to eq ('10011')
      expect(SignedDecimalToBinary.convert_with_neg_base(23)).to eq ('1101011')
      expect(SignedDecimalToBinary.convert_with_neg_base(-23)).to eq ('100111')
    end
  end

end