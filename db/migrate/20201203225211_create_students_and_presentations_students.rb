class CreateStudentsAndPresentationsStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.timestamps
    end

    create_table :presentations_students, id: false do |t|
      t.belongs_to :presentation
      t.belongs_to :student
    end
  end
end
