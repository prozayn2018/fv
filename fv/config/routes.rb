Rails.application.routes.draw do
  resources :markets do
  collection do
    get :test
    end
  end

  resources :prices do
  collection do
    get :price
    end
  end

  get 'markets/home/test', to: 'markets#test'
  get 'markets/home/price', to: 'markets#price'
  resources :prices
  get 'markets/home'
  get 'markets/new'
  root  'markets#home'

end
