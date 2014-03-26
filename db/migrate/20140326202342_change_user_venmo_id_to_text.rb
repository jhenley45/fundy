class ChangeUserVenmoIdToText < ActiveRecord::Migration
  def self.up
  	change_column :user_venmos, :venmo_id, :text
  end
end
