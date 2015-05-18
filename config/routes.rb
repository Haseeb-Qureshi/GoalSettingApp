Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    resources :goals, shallow: true, only: [:create, :edit, :update, :destroy] do
      member do
        patch "complete"
      end
      post 'cheers' => 'cheers#cheer'
    end
  end
  resource :session, only: [:new, :create, :destroy]
  resources :comments, only: [:create, :destroy]
  get 'leaderboard' => 'cheers#leaderboard'
end
