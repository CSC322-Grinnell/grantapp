# 
class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user( not logged in)
    if user.nil?
      can :read, Program
    elsif user.role == 'applicant'
      can :manage, App, user: user
      can :read, Program
    elsif user.role == 'reviewer'
      can :read, App, program_id: user.program_ids
      can :read, Program
    else
      can :read, Program
    end 
  end
end
