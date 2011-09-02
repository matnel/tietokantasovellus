FancyAppStore::Application.routes.draw do

  resources :applications do
     member do
       get 'version'
       get 'statistics'
     end
     resources :data_entries, :only => [ :new , :create ]
     resources :comments
  end

  resources :users do
    collection do
       post 'login'
       get 'logout'
    end
    resource :applications
  end

  root :to => 'applications#index'

end
