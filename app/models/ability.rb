#
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user( not logged in)
    if user.role == 'applicant'
      can :manage, App, :user => user
      can :read, Program
    elsif user.role == 'reviewer'
      can :read, App
      can :read, Program
    else
      can :read, Program
    end
  end
end
