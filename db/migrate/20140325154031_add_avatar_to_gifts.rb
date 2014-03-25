class AddAvatarToGifts < ActiveRecord::Migration
  def self.up
    add_attachment :gifts, :avatar
  end

  def self.down
    remove_attachment :gifts, :avatar
  end
end
