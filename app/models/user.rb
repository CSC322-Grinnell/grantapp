#
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

<<<<<<< HEAD
  attr_accessor :remember_token, :activation_token, :reset_token
  
  has_many :apps
  has_and_belongs_to_many :programs
  accepts_nested_attributes_for :programs
  validates_presence_of :first_name, :last_name, :phone_number, :organization
=======
  has_many :app
  has_many :feedback
  has_and_belongs_to_many :program
  accepts_nested_attributes_for :program
  validates_presence_of :first_name, :last_name, :phone_number, :organization, :email
>>>>>>> d4ea3f1ff870a392f004ffcc663344a57c8a8d2c
  validates_presence_of :address, :state, :city
  validates_length_of :phone_number, :is => 10
  validates_length_of :zip_code, :is => 5
  validates_numericality_of :phone_number, :zip_code
  
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
end
