class ChangeStateToIntInTasks < ActiveRecord::Migration[7.1]
  def change
    Task.update_all(state: 0)
    change_column :tasks, :state, :integer, default: 0
  end
end
