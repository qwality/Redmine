class ChangTaskFileAttachmentAsociation < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :file_attachment_id_id, :integer
    add_reference :file_attachments, :task, foreign_key: true
  end
end
