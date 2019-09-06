require 'rubygems'
require 'httparty'
require 'json'


  class Stock
    include HTTParty
    base_uri "eodhistoricaldata.com/"

    def data
      self.class.get('/api/fundamentals/AAPL.US?api_token=OeAFFmMliFG5orCUuwAKQ8l4WWFQ67YX&filter=General&limit&fmt=json')
    end

    def data2
      self.class.get('/api/eod/AAPL.US?api_token=OeAFFmMliFG5orCUuwAKQ8l4WWFQ67YX&fmt=json&filter=last_close')
    end

    def events
      data.parsed_response
    end
  end



name = Stock.new
puts name.events["Name"]
puts name.data2
