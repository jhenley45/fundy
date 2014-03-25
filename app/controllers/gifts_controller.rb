class GiftsController < ApplicationController

	def index

	end

	def show
		@gift = Gift.find(params[:id])
		@gift_owner_id = @gift.pledges.find_by(owner: true).user_id
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

	def edit
	  @gift = Gift.find(params[:id])
	end

	def update
		@gift = Gift.find(params[:id])
		if @gift.update(gift_params)
			flash['alert'] = "Your campaign '#{@gift.name}' has been successfully updated."
		  redirect_to @gift
		else
		  render 'edit'
		end
	end

	def destroy

		user = current_user
		@gift = Gift.find(params[:id])
		if user.gifts.delete(@gift)
			flash['alert'] = "Your campaign '#{@gift.name}' has been successfully deleted."
			redirect_to gifts_path
		end
	end

	private

	def gift_params
	  params.require(:gift).permit(:name, :end_date, :goal, :reason, :description)
	end

end
