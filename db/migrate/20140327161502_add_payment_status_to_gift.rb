class AddPaymentStatusToGift < ActiveRecord::Migration
  def change
    add_column :gifts, :payment_status, :text
  end
end
