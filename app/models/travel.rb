require 'http/client'

class Travel < ActiveRecord::Base
  has_many :travelers

  scope :actives, -> { where(active: true) }

  def self.sync_with_api(opts={})

    params = {
        'per_page' => 100,
        'q[start_date_gteq]' => '2014-01-01',
        'page' => opts.fetch(:page) {1}
    }

    client = Http::Client.new('institution_travels', params)

    puts "Retornados: #{client.response.length}, procesando..."
    client.response.each do |item|

      params = {
          'q[id_eq]' => item['institution_id']
      }

      client = Http::Client.new('institutions', params)
      institutions = client.response

      other_costs = 0
      item['others_cost'].gsub(/(?<other>\d+\.\d+|\d+)/).to_a.each { |m| other_costs += m.to_f }
      total_cost = item.fetch('travel_cost', 0) + item.fetch('viatical_cost', 0) + item.fetch('lodgment_cost', 0) + other_costs
      traveler = {
          name: item['institution_official_name'],
          position: item['institution_official_job'],
          institution: institutions.first['name'],
          cost_by_person: total_cost,
          travel_cost: item['travel_cost'],
          viatical_cost: item['viatical_cost'],
          lodgement_cost: item['lodgment_cost'],
          other_cost: item['other_cost'],
      }

      travel = {
        name: item['name'],
        destination: item['destination'],
        start_date: item['start_date'],
        end_date: item['end_date'],
        sponsor_contribution: item['sponsor_contribution'],
        institution_name: institutions.first['name'],
        institution_acronym: institutions.first['acronym'],
        api_id: item['id']
      }

      unless self.exists?(api_id: item[:api_id])
        @travel = self.find_by_name travel[:name]
        if @travel.nil?
          @travel = self.create travel
        end

        @travel.travelers.create(traveler)
      end
    end
  end
end
