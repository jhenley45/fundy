module GiftsHelper

	def sortable(column, title = nil)
		title ||= column.titleize
		css_class = column == params[:sort] ? 'highlighted_sort' : nil
		direction = column == params[:sort] && params[:direction] == 'asc' ? 'desc' : 'asc'
		link_to title, {sort: column, direction: direction}, {class: css_class}
	end


	def calculate_remaining
		sum = 0
		@gift.pledges.each do |pledge|
			sum += pledge.amount
		end
		@remainder = @gift.goal - sum
	end

	def gift_sort
		unless current_user
			@gifts = @gifts.where(private: false)
		else
			@gifts.delete_if {|gift| gift.private? && !current_user.invites.include?(gift)}
		end
	end

	def pledge_sum(gift)
	  pledge_sum = gift.pledges.sum(:amount)
	  funded_percent = '%.1f' % ((pledge_sum/gift.goal) * 100)
	  funded_percent.to_i < 100 ? funded_percent : 100
	end
end
