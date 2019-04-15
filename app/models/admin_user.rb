class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :feedback
  validates_presence_of :email
  
  def sadmin_user? (admin_user)
    self.role == "secondary_admin_users"
  end

end
