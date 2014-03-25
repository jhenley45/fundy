class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :user, index: true
      t.references :gift, index: true
      t.float :amount
      t.boolean :owner, default: false

      t.timestamps
    end
  end
end
