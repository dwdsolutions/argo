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
        render json: Travel.actives.order('start_date DESC').limit(10)
      end
    end
  end
end
