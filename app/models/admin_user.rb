class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

         
    attr_accessor :remember_token, :activation_token, :reset_token
   
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def AdminUser.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = AdminUser.new_token
    update_attribute(:reset_digest,  AdminUser.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  

  enum role: [:admin, :secondary]
  has_many :feedback
  has_and_belongs_to_many :program
  accepts_nested_attributes_for :program
  validates :email, :role, presence: true
end
