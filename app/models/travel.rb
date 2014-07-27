class Travel < ActiveRecord::Base
  def self.sync_with_api(opts={})
    url = 'http://api.gobiernoabierto.gob.sv/'
    endpoint = 'institution_travels'
    api_headers = {Authorization: 'Token token="36bc11762f97f155729497f7099d76c4"'}

    url_to_request = "#{url}#{endpoint}"
    params = {
        'per_page' => 100,
        'q[start_date_gteq]' => '2014-01-01',
        'page' => opts.fetch(:page) {1}
    }
    request = Typhoeus::Request.new(url_to_request, headers: api_headers, params: params)

    request.on_complete do |response|
      if response.code == 200
        @response = JSON.parse(response.response_body)
      end
    end

    request.run
    puts "Retornados: #{@response.length}, procesando..."
    results = @response.map do |item|
      url_to_request = "#{url}institutions"
      params = {
          'q[id_eq]' => item['institution_id']
      }
      request = Typhoeus::Request.new(url_to_request, headers: api_headers, params: params)

      request.on_complete do |response|
        if response.code == 200
          @institutions = JSON.parse(response.response_body)
        end
      end

      request.run
      puts "institution: #{@institutions}"
      total_cost = item.fetch('travel_cost', 0) + item.fetch('viatical_cost', 0)
      {
        name: item['name'],
        destination: item['destination'],
        start_date: item['start_date'],
        end_date: item['end_date'],
        sponsor_contribution: item['sponsor_contribution'],
        total_cost: total_cost,
        institution_name: @institutions.first['name'],
        institution_acronym: @institutions.first['acronym']
      }
    end
    puts "response: #{@response.first}"
    #self.create results
  end
end
