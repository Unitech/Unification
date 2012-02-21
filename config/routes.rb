Unification::Application.routes.draw do
  devise_for :labs

  scope :controller => 'home' do
    post '/new_student' => :new_student, :as => :new_student
    get '/edit' => :edit, :as => :edit
    put '/update' => :update, :as => :update
  end
  
  root :to => 'home#index'
end
