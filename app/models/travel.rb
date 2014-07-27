class Travel < ActiveRecord::Base
  def self.sync_with_api(opts={})
    url = 'http://api.gobiernoabierto.gob.sv/institution_travels?per_page=100&page=2&q[start_date_gteq]=2014-01-01'
    params = {
        'per_page' => 100,
        'q[start_date_gteq]' => '2014-01-01',
        'page' => opts.fetch(:page) {1}
    }
    request = Typhoeus::Request.new(url, headers: {Authorization: 'Token token="36bc11762f97f155729497f7099d76c4"'})

    request.on_complete do |response|
      if response.code == 200
        @response = JSON.parse(response.response_body)
      end
    end

    request.run
    puts "Retornados: #{@response.length}"
  end
end
