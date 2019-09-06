require 'rubygems'
require 'httparty'
require 'market'
require 'price'
require 'sidekiq'
require 'hard_worker'
require 'time'

class Worker3
  include Sidekiq::Worker
  sidekiq_options :queue => :third

  def perform(i)
    i = 507
    id = 1

    while i < 507
      cur = Market.find(id)

      begin
        $re = RestClient.get(
          'https://eodhistoricaldata.com/api/fundamentals/'+ cur.symbol + '.US?api_token=5d41fc10e6cbf2.26983233&filter=Highlights')
        $parse_json = JSON.parse($re)
      rescue
        $re = 0
      end

      thi = Market.update(id,
              :revenue => $parse_json['RevenueTTM'].to_f,
              :grossprofit => $parse_json['GrossProfitTTM'].to_f,
              :profitmargin => $parse_json['ProfitMargin'].to_f,
              :roa => $parse_json['ReturnOnAssetsTTM'].to_f,
              :roe => $parse_json['ReturnOnEquityTTM'].to_f,
              :eps => $parse_json['EarningsShare'].to_f,
              :ebitda => $parse_json['ReturnOnAssetsTTM'].to_f,
              :priceratio => $parse_json['PERatio'].to_f,
              :pricebook => $parse_json['BookValue'].to_f,
              :marketcap => $parse_json['MarketCapitalization'].to_f,
              :wallst => $parse_json['WallStreetTargetPrice'].to_f,

            )
      thi.save
      puts cur.symbol
      i += 1
      id += 1
    end
  end
end
