require 'rubygems'
require 'httparty'
require 'json'


  class This < ApplicationController
    include HTTParty
    base_uri "eodhistoricaldata.com/"

    def data
      self.class.get('/api/fundamentals/AAPL.US?api_token=OeAFFmMliFG5orCUuwAKQ8l4WWFQ67YX&filter=General&limit&fmt=json')
    end

    def data2
      self.class.get('/api/eod/AAPL.US?api_token=OeAFFmMliFG5orCUuwAKQ8l4WWFQ67YX&fmt=json&filter=last_close')
    end

    def data3
      self.class.get('/api/fundamentals/AAPL.US?api_token=OeAFFmMliFG5orCUuwAKQ8l4WWFQ67YX&filter=General&limit&fmt=json')
    end


    def events
      response = data.parsed_response
      Market.create(:symbol => response["Code"], :name => response['Name'])
    end


  end



name = This.new
puts name.events["Name"]
puts name.events["Code"]
puts name.data2
