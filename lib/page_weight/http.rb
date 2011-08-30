module PageWeight
  class HTTP
    def self.response_for(input)
      Net::HTTP.get_response(input)
    end
  end
end
