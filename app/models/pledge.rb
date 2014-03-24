class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :gift

  validates :amount, presence: true

end
