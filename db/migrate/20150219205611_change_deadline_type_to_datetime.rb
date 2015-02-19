class ChangeDeadlineTypeToDatetime < ActiveRecord::Migration
  
  def up
    change_column :programs, :deadline, :datetime
  end

  def down
    change_column :programs, :deadline, :string
  end
end



