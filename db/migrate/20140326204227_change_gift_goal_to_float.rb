class ChangeGiftGoalToFloat < ActiveRecord::Migration
  def self.up
  	change_column :gifts, :goal, :float
  end
end
