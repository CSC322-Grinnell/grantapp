class Application < ActiveRecord::Base
  belongs_to :user, :foreign_key => "id", :class_name => "User"
  belongs_to :program, :foreign_key => "id", :class_name => "Program"
end
