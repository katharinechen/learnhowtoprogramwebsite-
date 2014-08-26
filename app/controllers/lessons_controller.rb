class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
    render('lesson/index.html.erb')
  end

  def new
    render('lesson/new.html.erb')
  end

  def create
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save
      flash[:notice] = "You created the lesson #{@lesson.name}!"
      redirect_to('/lessons')
    else
      flash[:notice] = "Invalid Entry! Try again!!!!"
      render('lesson/new.html.erb')
    end
  end
end
