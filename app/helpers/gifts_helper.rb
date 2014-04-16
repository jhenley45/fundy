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

end
