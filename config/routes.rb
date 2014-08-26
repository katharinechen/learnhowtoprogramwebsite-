Rails.application.routes.draw do

  match('/', :via => :get, :to => 'application#index')
  match('/index', :via => :get, :to => 'application#index')

  match('lessons', {:via => :get, :to => 'lessons#index'})
  match('lessons/new', {:via => :get, :to => 'lessons#new'})
  match('lessons', {:via => :post, :to => 'lessons#create'})
  match('lessons/:id', {:via => :get, :to => "lessons#show"})
  match('lessons/:id', {:via => :delete, :to => 'lessons#destroy'})
  match('lessons/:id/edit', {:via => :get, :to => 'lessons#edit'})
  match('lessons/:id', {:via => [:patch, :put], :to => 'lessons#update'})

  match('sections', {:via => :get, :to => 'sections#index'})
  match('sections/new', {:via => :get, :to => 'sections#new'})
  match('sections', {:via => :post, :to => 'sections#create'})
  match('sections/:id', {:via => :get, :to => "sections#show"})
  match('sections/:id', {:via => :delete, :to => 'sections#destroy'})
  match('sections/:id/edit', {:via => :get, :to => 'sections#edit'})
  match('sections/:id', {:via => [:patch, :put], :to => 'sections#update'})

end
