class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.text :name
      t.text :description
      t.text :reason
      t.datetime :end_date
      t.integer :goal

      t.timestamps
    end
  end
end
