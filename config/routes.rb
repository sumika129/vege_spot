Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"

  namespace :public do
    get 'home/about'=>'homes#about',as:'about'
    resources :users, only: [:show, :edit, :update] do
      member do
        get :likes
      end
    end
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    get 'search' => 'posts#search'
    get 'area_search' => 'posts#area_search'
    get 'category_search' => 'posts#category_search'
  end

  namespace :admin do
    resources :categories, only: [:index, :create, :edit, :update]
    resources :areas, only: [:index, :create, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
