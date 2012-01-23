Rails.application.routes.draw do

  namespace :privmate do

    resources :events, :only => [ :index, :show ]

    match "info" => "privmate#info"

  end

end
