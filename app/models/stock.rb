class Stock < ApplicationRecord
  def self.new_lookup(ticker)
    client = Alphavantage::Client.new

    new(
      ticker: ticker,
      price: client.quote(ticker)["Global Quote"]["05. price"].to_i
    )
  end
end
