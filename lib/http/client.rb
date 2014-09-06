module Http
  class Client
    def initialize(url, headers=nil, params=nil)
      @response = nil
      if headers.nil? and params.nil?
        request = Typhoeus::Request.new(url)
      else
        request = Typhoeus::Request.new(url, headers: headers, params: params)
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