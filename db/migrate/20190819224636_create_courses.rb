class CreateCourses < ActiveRecord::Migration[5.2]

# This database will populate the course details.  
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.decimal :cost
      t.integer :user_id
      t.timestamps
    end
    add_index :courses, :user_id
  end
end
