Rails.application.routes.draw do
  devise_for :admins
  get 'static/index'
  get 'static/home'
  get 'static/contact'
  get 'static/about'

  # mount RootAPI => '/'
  # mount GrapeSwaggerRails::Engine => '/swagger'
  root 'static#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
