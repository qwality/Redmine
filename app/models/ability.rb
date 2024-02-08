# frozen_string_literal: true

class Ability
  include CanCan::Ability

  # @param [User] user is current_user
  # @note authorize user to perform actions
  def initialize(user)

    return unless user.present?

    can :read, :all

    can :my_tasks, Task
    can :my_projects, Project

    can [:update, :edit, :edit_in_table, :show_in_table, :show_in_table_update], Task, user_id: user.id

    # can :manage, Task, user_id: user.id
    # cannot :destroy, Task
    # cannot :create, Task

    # can :manage, Project, user_id: user.id
    # cannot :destroy, Project
    # cannot :create, Project

    return unless user.is_admin?

    can :manage, :all
  end
end
