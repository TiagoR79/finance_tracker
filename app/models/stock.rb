class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :ticker, presence: true

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
