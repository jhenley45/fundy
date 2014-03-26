class AddFundedToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :funded, :boolean
  end
end
