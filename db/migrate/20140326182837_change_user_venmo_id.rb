class ChangeUserVenmoId < ActiveRecord::Migration
  def self.up
  	change_column :user_venmos, :venmo_id, :bigint
  end
end
