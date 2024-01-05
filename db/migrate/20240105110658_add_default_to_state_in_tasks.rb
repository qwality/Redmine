class AddDefaultToStateInTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_default :tasks, :state, from: nil, to: 'new'
  end
end
