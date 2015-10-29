class AddUserApp < ActiveRecord::Migration
  def self.up
  add_attachment :apps, :user_app
  end
end
