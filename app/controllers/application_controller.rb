class ApplicationController < ActionController::Base
  def client
    @client ||= Alphavantage::Client.new
  end
end
