# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    return unless user.present?

    can :read, :all
    can :manage, Task, user_id: user.id
    cannot :destroy, Task
    cannot :create, Task

    return unless user.is_admin?

    can :manage, :all
  end
end
