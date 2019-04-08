class AddAssignmentToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :assignment, :string
  end
end
