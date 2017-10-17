Rails.application.routes.draw do

  root to: redirect('/home')

  get 'home' => 'sites#index'

  get 'lang' => 'localizations#set_lang'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :users do
    get :admin, :on => :member
  end

  resources :products

  scope '/api' do
    scope '/products' do
      get '/' => 'products_api#index'
    end

    post 'login' => 'users_api#login'
  end
end
