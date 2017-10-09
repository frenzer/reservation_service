class Ability
  include CanCan::Ability
  prepend Draper::CanCanCan

  def initialize(user)
    return unless user

    if user.admin?
      can :manage, Hotel
      can :manage, Comment
      can :cancel_reservation, Room
      can :create_comment, Room
    else
      can :read, Hotel
      can :create_comment, Room, user_id: user.id
      can :update, Comment, user_id: user.id
      can :destroy, Comment, user_id: user.id
      can :reserve, Room
    end

    can :read, Room
  end
end
