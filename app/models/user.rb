#
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :apps
  has_and_belongs_to_many :programs
  accepts_nested_attributes_for :programs
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :phone_number
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :address
  
  
end
