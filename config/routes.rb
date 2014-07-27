Rails.application.routes.draw do
namespace :api do
  namespace :v1 do
	get '/price/compare/:travel_id', to: 'price_comparation#compare'
  end
end
end
