class AddUsersAndAppstoFeedback < ActiveRecord::Migration
  def change
    add_reference :feedbacks, :user, index: true
    add_reference :feedbacks, :app, index: true
  end
end
