# lib/tasks/generate_osha_content.rake

namespace :db do
  desc 'Generates simplified OSHA content for testing'
  task generate_osha_content: :environment do
    require 'json' # This is needed for the to_json call
    puts "Generating simplified content for testing..."

    # Use a hard-coded hash to simulate the LLM output
    mock_data = {
      'Stairways and Ladders' => {
        lesson: {
          title: 'Stairways and Ladders',
          content: 'Falls from ladders are a leading cause of fatalities in construction. Always maintain three points of contact when climbing and ensure the ladder is on a stable, level surface. The top of an extension ladder should extend at least three feet above the landing area.'
        },
        quiz: [
          {
            text: 'How many points of contact should be maintained when climbing a ladder?',
            correct_answer: 'Three points',
            options: ['Two points', 'Three points', 'Four points', 'Five points']
          },
          {
            text: 'What is a common hazard associated with ladders?',
            correct_answer: 'Falls',
            options: ['Electrocution', 'Falls', 'Struck-by objects', 'Caught-in or -between']
          },
          {
            text: 'How far should an extension ladder extend above a landing area?',
            correct_answer: '3 feet',
            options: ['1 foot', '2 feet', '3 feet', '4 feet']
          }
        ]
      },
      'Fall Protection' => {
        lesson: {
          title: 'Fall Protection',
          content: 'The OSHA Fall Protection standard, Subpart M, applies when workers are at a height of 6 feet or more. Conventional systems include guardrails, safety nets, and personal fall arrest systems. Employers must assess the workplace for fall hazards and provide appropriate protection.'
        },
        quiz: [
          {
            text: 'At what height does the OSHA Fall Protection standard generally apply?',
            correct_answer: '6 feet or more',
            options: ['4 feet or more', '5 feet or more', '6 feet or more', '10 feet or more']
          },
          {
            text: 'Which of the following is NOT a conventional fall protection system?',
            correct_answer: 'Safety belts',
            options: ['Guardrail systems', 'Safety net systems', 'Safety belts', 'Personal fall arrest systems']
          },
          {
            text: 'What is the maximum arresting force allowed for a personal fall arrest system?',
            correct_answer: '1,800 pounds',
            options: ['1,000 pounds', '1,500 pounds', '1,800 pounds', '2,000 pounds']
          }
        ]
      }
    }

    mock_data.each do |topic_title, data|
      puts "Creating lesson and quiz for: #{topic_title}..."

      lesson = Lesson.create!(
        title: data[:lesson][:title],
        content: data[:lesson][:content]
      )

      data[:quiz].each do |question_data|
        QuizQuestion.create!(
          text: question_data[:text],
          correct_answer: question_data[:correct_answer],
          options: question_data[:options].to_json,
          lesson: lesson
        )
      end

      puts "Successfully created lesson and quiz for '#{topic_title}'."
    end
    puts "Database population complete."
  end
end
