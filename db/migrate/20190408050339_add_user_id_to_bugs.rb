class AddUserIdToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :user_id, :integer
    add_index :bugs, :user_id
  end
end
