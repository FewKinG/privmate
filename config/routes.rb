Rails.application.routes.draw do

  namespace :privmate do

    resources :privmate_events, :only => [ :index, :show ]

  end

end
