module Api
    module V1
	class PriceComparationController < ApplicationController
	
	  def show
		@price_comparation = PriceComparation.find(params[:id])
		render json: @price_comparation
	  end

	end
   end
end
