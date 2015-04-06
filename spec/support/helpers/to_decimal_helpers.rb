module ToDecimalHelpers
	def to_decimal binary, negative_base = false
		binary.reverse!
		decimal = 0

		if negative_base
			binary.chars.each_with_index do |c, index|
				c = c.to_i
				decimal += ((-2)**index) * c
			end
		end

		decimal
	end
end