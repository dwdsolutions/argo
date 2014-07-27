module Api
    module V1
	class TravelController < ApplicationController

		def show
		   @travel = Travel.find(params[:id])
		  json = Jbuilder.encode do |json|
		   json.travelers @travel.travelers do |t|
	  		   json.id t.id
	  		   json.name t.name
			   json.cost t.cost_by_person
		   end
		    json.id @travel.id
		    json.name @travel.name
		    json.destination @travel.destination
		    json.total_cost @travel.total_cost
		    json.start_date @travel.start_date
		    json.end_date @travel.end_date
		  end
		   render json: json
		end

		def travelers_for_institucion
		   	
		end
	end
   end
end
