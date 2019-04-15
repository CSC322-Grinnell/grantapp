class SecondaryAdmin < ActiveRecord::Base
      devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :feedback
  validates_presence_of :email
  
end
