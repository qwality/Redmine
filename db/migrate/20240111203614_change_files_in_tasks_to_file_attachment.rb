class ChangeFilesInTasksToFileAttachment < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :files
    add_reference :tasks, :file_attachment, foreign_key: true
  end
end
