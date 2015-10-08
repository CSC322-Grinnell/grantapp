#
class Program < ActiveRecord::Base
  has_many :apps
  has_and_belongs_to_many :users
  has_attached_file :application_form
  has_attached_file :rubric
  
  validates_attachment :application_form, presence: true
  #content_type: { content_type: "docx/pdf" }
  
  
  
end
