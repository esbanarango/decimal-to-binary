# Decimal to binary

[![Build Status](https://travis-ci.org/esbanarango/decimal-to-binary.svg?branch=master)](https://travis-ci.org/esbanarango/decimal-to-binary)

Implementation of the __Decimal to binary "problem"__. But enhanced.

With this class you can convert ANY decimal number (positive or negative) to binary. And you can also use a negative base (-2).


```` ruby
decimal_to_binary = DecimalToBinary.new # Pass true as an agument if you want to use a negative base.
decimal_to_binary.convert 200
# "11001000"
decimal_to_binary.convert -200
# "100111000"

decimal_to_binary.negative_base = true

decimal_to_binary.convert 200
# "111011000"
decimal_to_binary.convert -200
# "1101001000"

```
