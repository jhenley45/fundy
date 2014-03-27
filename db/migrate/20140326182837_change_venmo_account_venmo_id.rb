class ChangeVenmoAccountVenmoId < ActiveRecord::Migration
  def self.up
  	change_column :venmo_accounts, :venmo_id, :bigint
  end
end
