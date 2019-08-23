class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
  # insert tables for titles and course id's. 

      t.string :title
      t.integer :course_id

      t.timestamps
    end
    add_index :sections, :course_id
  end
end
