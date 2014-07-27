module Api
    module V1
	class PriceComparationController < ApplicationController
	
	  def compare
                #@travel = Travel.find(params[:travel_id])
		travel_cost = 2500
		json = Jbuilder.encode do |json|
		  json.comparations PriceComparation.comparations() do |c|
  		   json.id c.id
  		   json.description c.description
		   json.category c.category
		   json.unit_cost c.unit_cost
		   json.source_information c.source_information
		   json.count (travel_cost / c.unit_cost).round()
		  end		  
		end
		render json: json
	  end

	end
   end
end
