class AdminAbility
  include CanCan::Ability

  def initialize(user)
    if user.present? && user.admin?
      can :manage, :all
    else
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :manage, App
      can :manage, Feedback
      can :manage, Program
      can :manage, User
    end
  end
end