# app/controllers/api/v1/lessons_controller.rb

module Api
  module V1
    class LessonsController < ApplicationController
      def index
        lessons = Lesson.all
        render json: lessons
      end

      def show
        lesson = Lesson.find_by(id: params[:id])
        if lesson
          # Load the associated quiz questions
          quiz_questions = lesson.quiz_questions
          render json: {
            lesson: lesson,
            quiz_questions: quiz_questions
          }
        else
          render json: { error: 'Lesson not found' }, status: :not_found
        end
      end
    end
  end
end
