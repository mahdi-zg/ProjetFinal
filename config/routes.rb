Rails.application.routes.draw do
  get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: 'users#new' 
  
  get '/profil', to: 'users#edit', as: :profil
  get '/profil/answers/:id', to: 'users#answers', as: :answers
  post '/profil/answers', to: 'users#respond_answer'
  patch '/profil', to: 'users#update'


  #Session

    get '/login', to: 'sessions#new', as: :new_session
   post '/login', to: 'sessions#create'
    get 'logout', to: 'sessions#destroy', as: :destroy_session
  resources :sessions, only: [:new, :create]
  resources :passwords, only: [:new, :create, :edit, :update]  
  resources :users, only: [:new, :create, :edit] do 
    member do
      get 'confirm'
 
   end
  end 


  scope 'superadmin', module: 'admin', as: 'admin' do
    resources :species, except: [:show]

  end
scope 'superadmin', module: 'admin', as: 'admin' do
  resources :answers, except: [:show]

end

end
