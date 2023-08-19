class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :hobbies, :text
    add_column :users, :languages, :text
    add_column :users, :bio, :text
  end
end
