class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :gift

  validates :amount, presence: true
  validates_numericality_of :amount, on: :create
  validates_numericality_of :amount, on: :update

end
