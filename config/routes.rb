Rails.application.routes.draw do
  devise_for :users
  root to: "items#index" do
    root to: 'orders#index'
  end
  resources :items do
    resources :orders, only:[:index, :new, :create]
  end
end
