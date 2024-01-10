class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.string :state
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end