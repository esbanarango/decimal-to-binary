require 'spec_helper'
require_relative '../../lib/signed_decimal_to_binary.rb'

describe SignedDecimalToBinary do

  let(:to_limit) { 1_00_000 }

  context 'with positive base (2)' do

    let(:decimal_to_binary) { SignedDecimalToBinary.new }

    describe '#convert' do
      context 'when the decimal is positive' do
        it 'converts a decimal to a binary' do
          0.upto(to_limit) do |n|
            expect(decimal_to_binary.convert(n)).to eq("%b" % n)
          end
        end
      end
      context 'when the decimal is negative' do
        it 'converts a decimal to a binary' do
          1.upto(to_limit) do |n|
            expect(decimal_to_binary.convert(-n)).to eq ("%b" % (n*-1))[2..-1]
          end
        end
      end
    end

    describe '#to_negative' do
      it 'converts a binary string to its negative representation' do
        1.upto(to_limit) do |n|
          expect(decimal_to_binary.to_negative("%b" % n)).to eq ("%b" % (n*-1))[2..-1]
        end
      end
    end

  end

  context 'with negative base (-2)' do

    let(:decimal_to_binary) { SignedDecimalToBinary.new true }

    describe '#convert' do
      it 'converts a decimal to binary with negative base' do
        expect(decimal_to_binary.convert(-9)).to eq ('1101')
        expect(decimal_to_binary.convert(9)).to eq ('10011')
        expect(decimal_to_binary.convert(23)).to eq ('1101011')
        expect(decimal_to_binary.convert(-23)).to eq ('100111')
      end
    end

  end

end