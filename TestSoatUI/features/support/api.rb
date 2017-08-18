module API
  class ConsultarPlaca
    def self.request(body)
      puts "\nRequest Placas auto:\n #{JSON.pretty_generate(JSON.parse(body.to_json))}\n" if ENV["DEBUG"]
      #response = RestClient.post "#{HOST}/api/ordersvc/v1/order_flow", body,{'Content-Type' => 'application/json'}
        #byebug
        begin
          response = RestClient.post "#{HOST}/api/ordersvc/v1/order_flow", body,{'Content-Type' => 'application/json'}
          return true
        rescue => e
          if e.to_s=="422 Unprocessable Entity"
            puts "igual "
            return true
          else
            puts "no igual"
            raise e
          end
        end
      puts "\nResponse:\n #{JSON.pretty_generate(JSON.parse(response.body))}\n" if ENV["DEBUG"]
      JSON.parse(response.body)
    end
  end
end
World(API)
