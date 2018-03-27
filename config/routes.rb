Rails.application.routes.draw do

  # olivR - my routes 
  root 'home#index'
  get 'index' => 'home#index'
  get 'home' => 'home#index' 
  
  post 'game' => 'game#create'
  get '/gamestart' => 'game#start'
  post '/french' => 'game#french'
  post '/english' => 'game#english'
  post '/wheel' => 'game#wheel'
  
  get '/events/:id/:userstat_id' => 'events#show', as: :event
  # get '/userlogs/:event_id/:userstat_id' => 'userlogs#index', as: :userlog_event
  post '/userlogs/:event_id/:userstat_id' => 'userlogs#create', as: :create_userlog
  get '/userassets/:event_id/:userstat_id' => 'userassets#new', as: :userasset_event
  # post '/userassets' => 'userassets#create', as: :create_userasset
  
  # resources :users
  
  # OlivR - https://github.com/plataformatec/devise/wiki/How-To:-Change-the-default-sign_in-and-sign_out-routes
  devise_for :users, skip: [:sessions]    
  as :user do # = devise_scope :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

#   devise_for :users,
#     :path => "users",
#     :path_names => {
#       :sign_in => 'login',
#       :sign_out => 'logout',
# #      :password => 'secret',
# #      :confirmation => 'verification',
# #      :unlock => 'unblock',
# #      :registration => 'register',
#       :sign_up => 'let_me_in' }
end