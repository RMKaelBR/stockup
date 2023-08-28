class StocksController < ApplicationController
  def index
    @stocks = StockApiService.fetch_stock_data
  end
end
