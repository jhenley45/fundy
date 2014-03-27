class AddStatusStatusMsgToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :status, :text
    add_column :pledges, :status_msg, :text, default: 'Awaiting campaign funding.'
  end
end
