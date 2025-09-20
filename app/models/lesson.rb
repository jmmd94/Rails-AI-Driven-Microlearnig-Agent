# app/models/lesson.rb

class Lesson < ApplicationRecord
  has_many :quiz_questions
end
