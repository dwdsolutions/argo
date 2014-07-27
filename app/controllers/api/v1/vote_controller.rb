module Api
    module V1
	class VoteController < ApplicationController
		def vote_up
			@travel = Travel.where(:id => params[:travel_id]).first
			travel_id = @travel.id
			vote(travel_id,true)
			render json: get_votes_json(travel_id)
		end
		
		def vote_down
			@travel = Travel.where(:id => params[:travel_id]).first
			travel_id = @travel.id
			vote(travel_id,false)
			render json: get_votes_json(travel_id)
		end

		private

		def vote(travel_id,up)
		    client_ip = request.remote_ip
		    vote = Vote.where(:travel_id => travel_id, :ip => client_ip).first
			if !vote
			   vote = Vote.new
			   vote.travel_id = travel_id
			   vote.ip = client_ip
			   vote.vote_down = !up
			   vote.vote_up = up
			   vote.save
			end
		    vote	
		end

		def get_votes_json(travel_id)
		     Jbuilder.encode do |json|
			  json.travel_id travel_id
			  json.votes_up Vote.where(:vote_up =>true, :travel_id => travel_id).count
			  json.votes_down Vote.where(:vote_down =>true, :travel_id => travel_id).count
		     end	
		end
	end
   end
end
