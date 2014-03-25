class PledgesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @gift = Gift.find(params[:gift_id])
    @pledge = Pledge.new
  end

  def create
    @gift = Gift.find(params[:gift_id])
    @user = current_user
    @pledge = @gift.pledges.new(pledge_params)
    @pledge.user_id = @user.id

    if @pledge.save
      flash['alert'] = "Your pledge of $#{@pledge.amount} to '#{@gift.name}' has been successfully recorded!"
      redirect_to gift_path(@gift)
    end


  end

  def update
  end

  def destroy
  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount)
  end

end
