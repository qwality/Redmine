class CreateFileAttachment < ActiveRecord::Migration[7.1]
  def change
    create_table :file_attachments do |t|
      t.string :file
      t.timestamps
    end
  end
end
