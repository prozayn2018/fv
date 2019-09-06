json.extract! market, :id, :name, :current_price, :integer, :fair_value, :discount_value, :YTD_change, :created_at, :updated_at
json.url market_url(market, format: :json)
