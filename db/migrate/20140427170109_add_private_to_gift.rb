class AddPrivateToGift < ActiveRecord::Migration
  def change
    add_column :gifts, :private, :boolean, default: false
  end
end
