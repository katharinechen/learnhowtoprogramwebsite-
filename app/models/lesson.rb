class Lesson < ActiveRecord::Base

  validates :name, :presence => true
  validates :content, :presence => true
  validates :number, :presence => true, numericality: { only_integer: true }

  default_scope {order('number')}

  def next
    current_lesson_index = nil

    Lesson.all.each_with_index do |lesson, i|
      if (self == lesson)
        current_lesson_index = i
        break
      end
    end

    if current_lesson_index < (Lesson.all.length - 1)
      Lesson.all[current_lesson_index + 1]
    else
      Lesson.all[current_lesson_index]
    end
  end

end
