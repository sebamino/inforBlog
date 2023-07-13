Rails.application.routes.draw do
  resources :posts
  devise_for :users
  # Paginas estaticas
  get 'pages/home'
  get 'pages/terms'

  # Ruta raiz
  root 'pages#home'
end
