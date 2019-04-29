class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:admin, :secondary]
  has_many :feedback
  has_and_belongs_to_many :program
  accepts_nested_attributes_for :program
  validates :email, :role, presence: true
end
