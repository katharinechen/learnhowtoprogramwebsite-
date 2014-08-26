class Lesson < ActiveRecord::Base

  validates :name, :presence => true
  validates :content, :presence => true
  validates :number, :presence => true, numericality: { only_integer: true }

  default_scope {order('number')}

  @current_lesson_index = nil

  def get_current_lesson_index
    Lesson.all.each_with_index do |lesson, i|
      if (self == lesson)
        @current_lesson_index = i
        break
      end
    end
  end

  def next
    get_current_lesson_index

    if @current_lesson_index < (Lesson.all.length - 1)
      Lesson.all[@current_lesson_index + 1]
    else
      Lesson.all[@current_lesson_index]
    end
  end

  def prev
    get_current_lesson_index

    if @current_lesson_index > 0
      Lesson.all[@current_lesson_index - 1]
    else
      Lesson.all[@current_lesson_index]
    end
  end

end
