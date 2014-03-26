module GiftsHelper

	def calculate_remaining
		sum = 0
		@gift.pledges.each do |pledge|
			sum += pledge.amount
		end
		@remainder = @gift.goal - sum
	end

end
