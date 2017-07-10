class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    can :read, :all
    if user.admin?
      can :manage, [Post, Comment]
      can :destroy, User
    else
      can :create, [Post, Comment]
      can [:update, :destroy], [Post, Comment] do |resource|
        resource.user == user
      end
      can [:update, :destroy], User do |current_user|
        current_user == user
      end
    end
  end
end
