class Stock < ApplicationRecord
  def self.new_lookup(ticker)
    client = Alphavantage::Client.new
    
    begin
      new(
        ticker: ticker,
        price: client.quote(ticker)["Global Quote"]["05. price"].to_f
      )
    rescue => exception
      return nil
    end
  end
end
