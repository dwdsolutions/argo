Rails.application.routes.draw do
  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    namespace :v1 do
    get '/price/compare/:travel_id', to: 'price_comparation#compare'
    get '/vote/up/:travel_id', to: 'vote#vote_up'
    get '/vote/down/:travel_id', to: 'vote#vote_down'
    get '/travel/show/:id', to: 'travel#show'
    get '/travel/recents', to: 'travel#travels_recents'
    get '/travelers/institution/:id', to: 'travel#travelers_for_institucion'
    end
  end
end
