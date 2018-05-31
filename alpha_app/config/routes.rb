Rails.application.routes.draw do


  get 'articles/new'

  get 'articles/edit'

  root 'articles#index'

  resources 'articles'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
