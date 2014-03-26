class AddChargedToPledge < ActiveRecord::Migration
  def change
    add_column :pledges, :charged, :boolean
  end
end
