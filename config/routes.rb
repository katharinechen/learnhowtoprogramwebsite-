Rails.application.routes.draw do

  match('/', {:via => :get, :to => 'lessons#index'})
  match('lessons', {:via => :get, :to => 'lessons#index'})
  match('lessons/new', {:via => :get, :to => 'lessons#new'})
  match('lessons', {:via => :post, :to => 'lessons#create'})
end
