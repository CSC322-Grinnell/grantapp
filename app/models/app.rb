#
class App < ActiveRecord::Base
  belongs_to :user
  belongs_to :program
  
  has_attached_file :user_app
  
  validates_attachment :user_app, presence: true, content_type: { content_type: ['text/plain', 'application/pdf']}
   
end
