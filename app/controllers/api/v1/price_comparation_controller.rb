module API
  module V1
    class PriceComparationController < ApplicationController

      def compare
        @travel = Travel.where(:id => params[:travel_id]).first
        #@trave = Travel.find(62)
        travel_cost = @travel.total_cost.to_i
        comparations = PriceComparation.comparations().map do |c|
          c.count = (travel_cost / c.unit_cost).round()
        end
        # json = Jbuilder.encode do |json|
        #   json.comparations PriceComparation.comparations() do |c|
        #     json.id c.id
        #     json.description c.description
        #     json.category c.category
        #     json.unit_cost c.unit_cost
        #     json.source_information c.source_information
        #     json.count (travel_cost / c.unit_cost).round()
        #   end
        # end
        render json: comparations
      end

    end
  end
end
