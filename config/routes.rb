Rails.application.routes.draw do
  resources :songs
  get '/', to: 'songs#root'
end
