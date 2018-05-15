Rails.application.routes.draw do
  get 'sign_up', to: 'users#new'

  root to: 'static_pages#home'

  get '/home', to: 'static_pages#home'

  get '/help', to: 'static_pages#help', as:'help'

  get '/about', to: 'static_pages#about'

  get '/contact', to: 'static_pages#contact'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
