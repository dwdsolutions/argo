Rails.application.routes.draw do
  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    namespace :v1 do
    get '/price/compare/:travel_id', to: 'price_comparation#compare'
    get '/vote/up/:travel_id', to: 'vote#vote_up'
    get '/vote/down/:travel_id', to: 'vote#vote_down'
    with_options only: :show do |list_and_show|
      list_and_show.resources :travels do
        collection do
          get 'recents', action: 'travels_recents'
          get 'most-expensives', action: 'most_expensives'
        end
      end
    end
    get '/travelers/institution/:id', to: 'travel#travelers_for_institucion'
    end
  end
end
