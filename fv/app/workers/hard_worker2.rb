require 'rubygems'
require 'httparty'
require 'market'
require 'price'
require 'sidekiq'
require 'hard_worker'
require 'time'

# class woker to update current price each day in markets table
class Worker2
  include Sidekiq::Worker
  sidekiq_options :queue => :second

  def perform(i)
    i = 1
    id = 3
    while i < 506
     current = Market.find(id)

     begin
      $res = RestClient.get('https://eodhistoricaldata.com/api/eod/' + current.symbol + '.US?api_token=5d41fc10e6cbf2.26983233&fmt=json&filter=last_close')
      $parsed_json = JSON.parse($res)
     rescue
      $res = 0
     end

      #error here: current.update(current_price: res)
      this = Market.update(id, :current_price => $parsed_json.to_f)
      this.save
      id += 1 #id will be at 4 next
      i += 1
    end
  end
end
