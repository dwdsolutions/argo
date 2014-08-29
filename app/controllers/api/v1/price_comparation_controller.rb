module API
  module V1
    class PriceComparationController < ApplicationController

      def compare
        @travel = Travel.where(:id => params[:travel_id]).first

        travel_cost = @travel.total_cost.to_i
        comparations = PriceComparation.comparations().map do |c|
          c.count = (travel_cost / c.unit_cost).round()
          c
        end

        render json: comparations, root: :comparations
      end

    end
  end
end
