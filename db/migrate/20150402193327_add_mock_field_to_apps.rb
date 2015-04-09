class AddMockFieldToApps < ActiveRecord::Migration
  def change
    add_column :apps, :text, :string
  end
end
