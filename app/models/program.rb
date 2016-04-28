#
class Program < ActiveRecord::Base
  has_many :apps
  has_and_belongs_to_many :users
  has_attached_file :application_form
  has_attached_file :rubric
  
  Paperclip::Attachment.default_options[:default_url] = "/"
  
  validates_attachment :application_form, presence: true, content_type: { content_type: ['text/plain', 'application/pdf', 'application/msword', 'application/vnd.ms-excel',     
                                                                                 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                                                                                 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']}
  validates_attachment :rubric, content_type: { content_type: ['text/plain', 'application/pdf', 'application/msword', 'application/vnd.ms-excel',     
                                                                                 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                                                                                 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']}
  
  
end
