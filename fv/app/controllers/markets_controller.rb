require 'rubygems'
require 'httparty'
require 'market'
require 'price'
require 'sidekiq'
require 'hard_worker'
require 'hard_worker2'
require 'hard_worker3'
require "time"


class MarketsController < ApplicationController
  before_action :set_market, only: [:show, :edit, :update, :destroy]
  before_action :set_price, only: [:show, :edit, :update, :destroy]


  # GET /markets
  # GET /markets.json




  def home
    @market = Market.first
    @price = Price.last
    result = RestClient.get('https://www.eodhistoricaldata.com/api/fundamentals/AAPL.US?api_token=OeAFFmMliFG5orCUuwAKQ8l4WWFQ67YX&filter=General&limit&fmt=json')
    parsed_json = JSON.parse(result)
    @market = Market.new(
      symbol: parsed_json['Code'],
      name: parsed_json['Name']
    )
    @market.save


    def test
      @test=Market.all
      respond_to do |format|
      format.html
      format.json {render :json => @test}
      end
    end

    def price
      @price = Price.where(compsymb: params[:comp])
      respond_to do |format|
      format.html
      format.json {render :json => @price}
      end
    end





#functions below call Sidekiq worker to run api calls asynchronously using redis server as cache
    def histcall
      HardWorker.perform_at(24.hours, 1)
      puts "Cron job: Stocks being added to db"
    end
    histcall()

    def currentcall
      Worker2.perform_at(24.hours, 1)
      puts "Cron job: for Current price being updated in markets table every 24 hours "
    end
    currentcall()

    def fundamentalcall
      Worker3.perform_at(24.hours, 1)
      puts "Cron job: fundamentals being updated in Markets table every 24 hours."
    end
    fundamentalcall()
  end

  # GET /markets/1
  # GET /markets/1.json


  def data
    @market = Market.first
  end


  def show
  end

  # GET /markets/new
  def new
    @market = Market.new
  end

  # GET /markets/1/edit
  def edit
  end

  # POST /markets
  # POST /markets.json
  def create
    @market = Market.new(market_params)

    respond_to do |format|
      if @market.save
        format.html { redirect_to @market, notice: 'Market was successfully created.' }
        format.json { render :show, status: :created, location: @market }
      else
        format.html { render :new }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end


    @price = Price.new(price_params)

    respond_to do |format|
      if @price.save
        format.html { redirect_to @price, notice: 'P was successfully created.' }
        format.json { render :show, status: :created, location: @price }
      else
        format.html { render :new }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /markets/1
  # PATCH/PUT /markets/1.json
  def update
    respond_to do |format|
      if @market.update(market_params)
        format.html { redirect_to @market, notice: 'Market was successfully updated.' }
        format.json { render :show, status: :ok, location: @market }
      else
        format.html { render :edit }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markets/1
  # DELETE /markets/1.json
  def destroy
    @market.destroy
    respond_to do |format|
      format.html { redirect_to markets_url, notice: 'Market was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market
      @market = Market.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def market_params
      params.require(:market).permit(:name, :current_price, :integer, :fair_value, :discount_value, :YTD_change)
    end
end
