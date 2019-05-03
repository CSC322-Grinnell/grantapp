class AdminAbility
  include CanCan::Ability

  def initialize(user)
    if user.present? && user.admin?
      can :manage, :all
    else
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :manage, App
      can :manage, Feedback #, program_id: user.program_ids This will limit the feedbacks that a Sadmin can look at by program
      can :manage, Program,  program_id: user.program_ids # Not working, program id not being stored
      can :manage, User
    end
  end
end