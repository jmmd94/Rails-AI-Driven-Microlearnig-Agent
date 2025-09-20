class CreateQuizQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :quiz_questions do |t|
      t.text :text
      t.string :correct_answer
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
