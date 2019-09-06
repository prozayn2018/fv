require 'rubygems'
require 'httparty'

  class Stock
    include HTTParty
    base_uri "eodhistoricaldata.com/"

    def data
      self.class.get('/api/eod/AAPL.US?api_token=OeAFFmMliFG5orCUuwAKQ8l4WWFQ67YX&fmt=json&filter=last_close')
    end
  end

eod = Stock.new

puts eod.data
