module Alphavantage
  class Client
    def initialize
      @host = 'alpha-vantage.p.rapidapi.com'
      #run EDITOR='code --wait' rails credentials:edit - needs master.key
      @key = Rails.application.credentials.rapid_api[:rapid_api_key]
    end

    def quote(ticker)
      get("query?function=GLOBAL_QUOTE&symbol=#{ticker}")
    end

    private

    def get(path)
      response = Excon.get(
          'https://' + @host + '/' + path + '&datatype=json',
          headers: {
          'x-rapidapi-host' => @host,
          'x-rapidapi-key' => @key,
          }
      )

      return false if response.status != 200

      JSON.parse(response.body)
    end
  end
end