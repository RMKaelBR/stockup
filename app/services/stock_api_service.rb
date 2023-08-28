require 'net/http'
require 'json'

class StockApiService
  def self.fetch_stock_data
    url = URI.parse('http://phisix-api.appspot.com/stocks.json')
    begin
      response = Net::HTTP.get_response(url)
      if response.code == '302'
        new_url = URI.parse(response['location'])
        response = Net::HTTP.get_response(new_url)
      end
      puts "Stocks received!"
      data = JSON.parse(response.body)
      data['stock'] # does it need to be stored in a variable?
    rescue StandardError => e
      puts "Error fetching or parsing data: #{e}"
    end
  end
end