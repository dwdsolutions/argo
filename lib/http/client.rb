module Http
  class Client
    def initialize(endpoint, params=nil)
      @headers = {Authorization: 'Token token="36bc11762f97f155729497f7099d76c4"'}
      @base_url = 'http://api.gobiernoabierto.gob.sv/'
      url = "#{@base_url}#{endpoint}"
      if @headers.nil? and params.nil?
        request = Typhoeus::Request.new(url)
      else
        request = Typhoeus::Request.new(url, headers: @headers, params: params)
      end

      request.on_complete do |response|
        if response.code == 200
          @response = JSON.parse(response.response_body)
        end
      end

      request.run
    end

    attr_reader :response
  end
end