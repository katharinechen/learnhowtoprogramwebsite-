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

  def show
    @lesson = Lesson.find(params[:id])
    render('lesson/show.html.erb')
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:notice] = "You destroyed the lesson: #{@lesson.name}!"
    redirect_to('/lessons')
  end

  def edit
    @lesson = Lesson.find(params[:id])
    render('lesson/edit.html.erb')
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(params[:lesson])
      flash[:notice] = "You have sucessfully updated #{@lesson.name}."
      redirect_to("/lessons/#{@lesson.id}")
    else
      flash[:notice] = "You have FAILED. Try again."
      render('lesson/edit.html.erb')
    end
  end
end
