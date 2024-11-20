Rails.application.routes.draw do
  namespace :api, default: { format: 'json' } do
    namespace :v1 do
      resources :users
      resources :documents
      get 'my-documents', to: 'users#my_documents'
    end
  end
end
