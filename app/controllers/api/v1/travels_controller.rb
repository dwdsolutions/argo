module API
  module V1
    class TravelsController < ApplicationController

      def show
        @travel = Travel.find(params[:id])
        render json: @travel, serializer: TravelSerializer, root: false
      end

      def travelers_for_institucion
        render json: Traveler.actives.group(:institution_acronym).count
      end

      def travels_recents
        render json: Travel.includes(:travelers).actives.order('start_date DESC').limit(10), root:false
      end

      def most_expensives
        render json: Travel.includes(:travelers).actives.order('total_cost DESC').limit(10), root:false
      end
    end
  end
end
