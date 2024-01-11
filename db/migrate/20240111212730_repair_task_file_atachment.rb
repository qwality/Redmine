class RepairTaskFileAtachment < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :file_attachment_id, :integer
  end
end
