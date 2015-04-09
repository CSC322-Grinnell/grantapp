class Program < ActiveRecord::Base
  has_many :apps
  has_many :users
end
