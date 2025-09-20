class AddOptionsToQuizQuestions < ActiveRecord::Migration[8.0]
  def change
    add_column :quiz_questions, :options, :text
  end
end
