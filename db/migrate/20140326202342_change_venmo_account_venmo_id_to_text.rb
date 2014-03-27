class ChangeVenmoAccountVenmoIdToText < ActiveRecord::Migration
  def self.up
  	change_column :venmo_accounts, :venmo_id, :text
  end
end
