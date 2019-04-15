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
      can :manage, Feedback, user: user
      can :read, App, program_id: user.program_ids
      can :read, Program
    else
      can :read, Program
    end 
  end
  
  #Defining admin_user abilities. 
  def initialize(admin_users)
     #admin_users ||= User.new # guest user( not logged in)
    if admin_users.nil?
      can :read, Program
    elsif admin_users.role == 'admin_users'
      can :manage, App, admin_users: admin_users
      can :manage, Program
      can :manage, User
      can :manage, AdminUser
      can :manage, Feedback, admin_users: admin_users
    elsif admin_users.role == 'secondary_admin_users'
      can :manage, App, admin_users: admin_users
      can :manage, Program
      can :manage, User
      can :manage, Feedback, admin_users: admin_users
    else
      can :read, Program
    end 
  end
end
