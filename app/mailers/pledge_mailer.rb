class PledgeMailer < ActionMailer::Base
  default from: "fundyapp@gmail.com"

  def pledge_email(pledge, user)
  	@pledge = pledge
  	@user = user
  	mail(to: @user.email, subject: 'Your Pledge on FundyApp')
  end
end
