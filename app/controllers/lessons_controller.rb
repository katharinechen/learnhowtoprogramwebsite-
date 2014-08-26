class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
    render('lesson/index.html.erb')
  end

end
