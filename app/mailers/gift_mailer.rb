class GiftMailer < ActionMailer::Base
  default from: "fundyapp@gmail.com"

  def gift_funded(pledge, gift, user)
  	@pledge = pledge
  	@gift = gift
  	@user = user
  	mail(to: @gift.owner.email, subject: 'Your Campaign Has Been Funded!')
  end
end
