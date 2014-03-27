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
    @pledge = @user.pledges.new(pledge_params)
    @pledge.gift_id = @gift.id

    if @pledge.save
      if @gift.funded?
        @gift.charge_gift_pledges
      else
        @gift.check_pledge_total
      end
      flash['alert'] = "Your pledge of $#{@pledge.amount} to '#{@gift.name}' has been successfully recorded!"
      redirect_to gift_path(@gift)
    else
      flash.now['errors'] = @pledge.errors.full_messages.join(', ')
      render :new
    end


  end

  def edit
    @gift = Gift.find(params[:gift_id])
    @pledge = Pledge.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:gift_id])
    @pledge = Pledge.find(params[:id])
    if @pledge.update(pledge_params)
      flash['alert'] = "Your pledge of $#{@pledge.amount} to '#{@gift.name}' has been successfully updated!"
      redirect_to @gift
    else
      flash.now['errors'] = @pledge.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @gift = Gift.find(params[:gift_id])
    @pledge = Pledge.find(params[:id])
    if @pledge.delete
      flash['alert'] = "Your pledge of $#{@pledge.amount} to '#{@gift.name}' has been successfully deleted!"
      redirect_to gift_path(@gift)
    else
      flash.now['errors'] = @gift.errors.full_messages.join(', ')
      render :show
    end
  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount)
  end

end
