class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :gifts, -> { uniq }, through: :pledges
  has_many :pledges
  has_one :venmo_account

  # Checks to see if a user's pledge is a duplicate a previous pledge for a given gift
  def is_pledge_duplicate?(gift, pledge)
  	amount_array = self.pledges.where(gift_id: gift.id).pluck(:amount)
  	amount_array.include?(pledge['amount'].to_f)
  end
end
