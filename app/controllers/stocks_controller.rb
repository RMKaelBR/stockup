class StocksController < ApplicationController
  def index
    @stocks = fetch_stocks_data_from_api
    render json: @stocks
  end

  private

  def fetch_stocks_data_from_api
    return StockApiService.fetch_stock_data
  end
end
