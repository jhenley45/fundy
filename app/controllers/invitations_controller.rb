class InvitationsController < ApplicationController
  def index
  end

  def new
    @gift = Gift.find(params[:gift_id])
    @invitation = Invitation.new
  end

  def create
    params[:invite_ids].each do |invite_id|
      Invitation.create!(user_id: invite_id, gift_id: params[:gift_id])
    end
  end

  def show
  end

  def destroy
  end

  private

  def invitation_params
    params.permit(:gift_id, :invite_ids)
  end
end
