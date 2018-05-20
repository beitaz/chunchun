Rails.application.routes.draw do
  get 'static/index'
  get 'static/home'
  get 'static/contact'
  get 'static/about'


  mount BaseAPI => '/'
  root 'static#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
