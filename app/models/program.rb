#
class Program < ActiveRecord::Base
  has_many :apps
  has_and_belongs_to_many :users
end
