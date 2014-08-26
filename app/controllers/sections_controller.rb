class SectionsController < ApplicationController

  def index
    @sections = Section.all
    render('section/index.html.erb')
  end

  def new
    render('section/new.html.erb')
  end

  def create
    @section = Section.new(params[:section])
    if @section.save
      flash[:notice] = "You created the section #{@section.name}!"
      redirect_to('/sections')
    else
      flash[:notice] = "Invalid Entry! Try again!!!!"
      render('section/new.html.erb')
    end
  end

  def show
    @section = Section.find(params[:id])
    render('section/show.html.erb')
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "You destroyed the section: #{@section.name}!"
    redirect_to('/sections')
  end

  def edit
    @section = Section.find(params[:id])
    render('section/edit.html.erb')
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(params[:section])
      flash[:notice] = "You have sucessfully updated #{@section.name}."
      redirect_to("/sections/#{@section.id}")
    else
      flash[:notice] = "You have FAILED. Try again."
      render('section/edit.html.erb')
    end
  end
end
