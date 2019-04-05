class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.date :deadline
      t.string :picture
      t.string :bug_type
      t.string :bug_status
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
