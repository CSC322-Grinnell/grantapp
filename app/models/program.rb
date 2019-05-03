#
class Program < ActiveRecord::Base
  has_many :app
  has_and_belongs_to_many :user
  has_and_belongs_to_many :admin_users
  has_attached_file :application_form
  has_attached_file :rubric
  
  Paperclip::Attachment.default_options[:default_url] = "/"
  validates :title, presence: true
  validates :short_description, presence: true
  validates :long_description, presence: true
  validates :deadline, presence: true
  validates :tags, presence: true
  
  validates_attachment :application_form, presence: true, content_type: { content_type: ['text/plain', 'application/pdf', 'application/msword', 'application/vnd.ms-excel',     
                                                                                 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                                                                                 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']}
  validates_attachment :rubric, content_type: { content_type: ['text/plain', 'application/pdf', 'application/msword', 'application/vnd.ms-excel',     
                                                                                 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                                                                                 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']}
  #scope :by_reviewer { |reviewer| where(reviewer_id: reviewer.id)}
  #Preparation for sorting out the programs reviewers can see on home page
  #to only be the ones they're assigned to
end
