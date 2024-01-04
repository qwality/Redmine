class RenameSecondNameToLastName < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :second_name, :last_name
  end
end
