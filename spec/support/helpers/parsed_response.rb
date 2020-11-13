module TestHelpers
  module ParsedResponse
    def parsed_response
      JSON.parse(response.body)
    end
  end
end
