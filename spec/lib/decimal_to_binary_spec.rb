require 'spec_helper'
require_relative '../../lib/decimal_to_binary.rb'

describe DecimalToBinary do

  let(:to_limit) { 1_00_000 }

  context 'with positive base (2)' do

    let(:decimal_to_binary) { DecimalToBinary.new }

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

    let(:decimal_to_binary) { DecimalToBinary.new true }

    describe '#convert' do
      it 'converts a decimal to binary with negative base' do

        (-to_limit).upto(to_limit) do |n|
          binary = decimal_to_binary.convert(n)
          expect(to_decimal(binary, true)).to eq (n)
        end

        expect(decimal_to_binary.convert(-9)).to eq ('1011')
        expect(decimal_to_binary.convert(9)).to eq ('11001')
        expect(decimal_to_binary.convert(23)).to eq ('1101011')
        expect(decimal_to_binary.convert(-23)).to eq ('111001')

      end
    end

  end

end