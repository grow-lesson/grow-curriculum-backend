class AddProfileInfoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :hobbies, :string
    add_column :users, :languages, :string
    add_column :users, :bio, :text
  end
end
