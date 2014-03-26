class CreateUserVenmos < ActiveRecord::Migration
  def change
    create_table :user_venmos do |t|
      t.references :user, index: true
      t.text :access_token
      t.integer :expires_in
      t.text :username
      t.text :first_name
      t.text :last_name
      t.text :display_name
      t.text :email
      t.text :phone
      t.text :about
      t.text :profile_pic
      t.integer :venmo_id
      t.text :refresh_token

      t.timestamps
    end
  end
end
