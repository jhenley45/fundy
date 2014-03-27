class RemovePhoneEmailFromVenmoAccounts < ActiveRecord::Migration
  def up
    remove_column :venmo_accounts, :phone
    remove_column :venmo_accounts, :email
  end
end
