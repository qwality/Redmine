class AddFilesArrayColumnToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :files, :text
  end
end
