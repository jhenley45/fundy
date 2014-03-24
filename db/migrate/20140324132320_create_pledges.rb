class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :user, index: true
      t.references :gift, index: true
      t.decimal :amount
      t.boolean :owner

      t.timestamps
    end
  end
end
