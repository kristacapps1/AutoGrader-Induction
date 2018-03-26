class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :problem
      t.string :due_date
      t.integer :possible_grade
      t.integer :actual_grade
      t.text :solution
      t.text :student_solution
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
