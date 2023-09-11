class StocksController < ApplicationController
  # before_action :require_user_login!
  # before_action :authenticate_user!
  before_action :require_login
  
  def index
    @stocks = fetch_stocks_data_from_api
    render json: @stocks
  end

  def show
    @symbol = params[:symbol]
    @stock = fetch_single_stock_data(@symbol)
    render json: @stock
  end

  private

  def fetch_single_stock_data(symbol)
    return StockApiService.fetch_stock_data(symbol)
  end
  
  def fetch_stocks_data_from_api
    return StockApiService.fetch_stock_data
  end
end
