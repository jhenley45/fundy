class PledgesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @gift = Gift.find(params[:gift_id])
    @pledge = Pledge.new
    @gift_owner_id = @gift.pledges.find_by(owner: true).user_id
  end

  def create
    @gift = Gift.find(params[:gift_id])
    @user = current_user
    @pledge = @user.pledges.new(pledge_params)
    @pledge.gift_id = @gift.id

    if @user.is_pledge_duplicate?(@gift, @pledge)
      flash['alert'] = "This is a duplicate. Please alter this pledge in order to help us process it."
      redirect_to gift_path(@gift) and return
    end

    if @pledge.save
      if @gift.funded?
        @gift.charge_gift_pledges
        @pledge.reload
        if @pledge.status == 'settled'
          flash['notice'] = "Your pledge of $#{@pledge.amount} to '#{@gift.name}' has been successfully processed!"
        elsif @pledge.status == 'pending'
          flash['notice'] = "Your pledge of $#{@pledge.amount} to '#{@gift.name}' is pending in Venmo."
        else
          flash['alert'] = 'Venmo payment error: ' + @pledge.status_msg
        end
        redirect_to gift_path(@gift)
      else
        gift_now_funded = @gift.check_if_funded
        if gift_now_funded
          @gift.charge_gift_pledges
          flash['notice'] = "Your pledge of $#{@pledge.amount} to '#{@gift.name}' has successfully funded this campaign!"
        else
          flash['notice'] = "Your pledge of $#{@pledge.amount} to '#{@gift.name}' has been successfully recorded!"
        end
        redirect_to gift_path(@gift)
      end
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

    if current_user.is_pledge_duplicate?(@gift, pledge_params)
      flash['alert'] = "This is a duplicate. Please alter this pledge in order to help us process it."
      redirect_to gift_path(@gift) and return
    end

    if @pledge.update(pledge_params)
      gift_now_funded = @gift.check_if_funded
      if gift_now_funded
        @gift.charge_gift_pledges
        flash['notice'] = "Your updated pledge of $#{@pledge.amount} to '#{@gift.name}' has successfully funded this campaign!"
      else
        flash['notice'] = "Your updated pledge of $#{@pledge.amount} to '#{@gift.name}' has been successfully recorded!"
      end
      redirect_to gift_path(@gift)
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
