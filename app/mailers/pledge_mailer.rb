class PledgeMailer < ActionMailer::Base
  default from: "fundyapp@gmail.com"

  def pledge_email(pledge, user)
  	@pledge = pledge
  	@user = user
  	mail(to: @user.email, subject: 'Your Pledge on FundyApp')
  end

  def pledge_owner_email(pledge, user)
  	@pledge = pledge
  	@user = user
  	@owner = pledge.gift.owner
  	mail(to: @owner.email, subject: 'A New Pledge Was Made to Your Campaign!')
  end
end
