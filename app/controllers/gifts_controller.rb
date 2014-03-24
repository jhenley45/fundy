class GiftsController < ApplicationController

	def index

	end

	def show
		@gift = Gift.find(params[:id])
	end

	def new
		@gift = Gift.new
	end

	def create
		@user = current_user
		@gift = Gift.new(gift_params)

		if @gift.save
			@user.pledges.create!(gift: @gift, owner: true, amount: 0)
			flash['alert'] = 'Your new gift campaign has been successfully created!'
			redirect_to gift_path(@gift)
		end

	end

	private

	def gift_params
	  params.require(:gift).permit(:name, :description, :reason, :end_date, :goal)
	end

end
