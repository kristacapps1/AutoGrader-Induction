class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :problem
      t.datetime :due_date
      t.integer :possible_grade
      t.text :solution
      t.string :basis
      t.text :induction
      t.timestamps null: false
    end
  end
end
