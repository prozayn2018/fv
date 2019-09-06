require 'rubygems'
require 'httparty'
require 'market'
require 'price'
require 'sidekiq'
require 'hard_worker'
require 'time'


# class worker to post new record onti prices table for each company
class HardWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :first

  def perform(i)
    i = 1
    id = 3
    while i < 506
      current_comp = Market.find(id)

      begin

        t = Time.now
        date = t.strftime("%Y/%m/%d")

        $call = RestClient.get('https://eodhistoricaldata.com/api/eod/' + current_comp.symbol + '.US?from=' + date + '&to=' + date + '&api_token=5d41fc10e6cbf2.26983233&fmt=json&period=d.')
        $json = JSON.parse($call)

        $json.each do |child|
          @save_this = Price.new(
          #this will be the id from Market.id
            :market_id => current_comp.id,
            :compsymb => current_comp.symbol.to_s,
            :datetime => child["date"].to_time,
            :stock_price => child["close"].to_f
          )
          @save_this.save(validate: false)
        end
      rescue
        $call = 0
      end

      i += 1
      id += 1
    end
  end
end
