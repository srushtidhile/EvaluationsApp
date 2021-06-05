class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :comment
      t.string :grade
      t.references :student, null: false, foreign_key: true
      t.references :presentation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
