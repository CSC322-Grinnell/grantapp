#
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :app
  has_many :feedback
  has_and_belongs_to_many :program
  accepts_nested_attributes_for :program
  validates_presence_of :first_name, :last_name, :phone_number, :organization, :email
  validates_presence_of :address, :state, :city
  validates_length_of :phone_number, :is => 10
  validates_length_of :zip_code, :is => 5
  validates_numericality_of :phone_number, :zip_code
  
  
end
