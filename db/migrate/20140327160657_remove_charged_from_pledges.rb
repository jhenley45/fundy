class RemoveChargedFromPledges < ActiveRecord::Migration
  def up
    remove_column :pledges, :charged
  end
end
