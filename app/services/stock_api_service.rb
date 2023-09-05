require 'net/http'
require 'json'

class StockApiService
  BASE_URL = 'http://phisix-api.appspot.com/stocks'

  def self.fetch_stock_data(symbol = nil)
    url = if symbol
      URI.parse("#{BASE_URL}/#{symbol}.json")
    else
      URI.parse("#{BASE_URL}.json")
    end
    
    begin
      response = Net::HTTP.get_response(url)
      if response.code == '302'
        new_url = URI.parse(response['location'])
        response = Net::HTTP.get_response(new_url)
      end
      puts "Stock(s) received!"
      data = JSON.parse(response.body)
      data['stock'] # does it need to be stored in a variable?
    rescue StandardError => e
      puts "Error fetching or parsing data: #{e}"
    end
  end
end