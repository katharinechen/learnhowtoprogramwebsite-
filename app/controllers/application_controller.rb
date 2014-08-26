class ApplicationController < ActionController::Base

  def index
    @sections = Section.all
    @lessons = Lesson.all
    render('/index.html.erb')
  end

end
