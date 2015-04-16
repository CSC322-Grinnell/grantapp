#
class Ability
  include CanCan::Ability

  def initialize(user)
    #user ||= User.new # guest user( not logged in)
    if user.nil?
      can :read, Program
    elsif user.role == 'applicant'
      can :manage, App, :user => user
      can :read, Program
    elsif user.role == 'reviewer'
      can :read, App, :program => user.program_ids[0]
      can :read, Program
    end 
  end
end
