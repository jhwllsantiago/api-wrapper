module Rawg
  class Request
    TOKEN = Rails.application.credentials.api_key.rawg
    BASE_URL = "https://api.rawg.io/api"

    def self.call method, endpoint, options
      result = RestClient::Request.execute(
        method: method,
        url: "#{BASE_URL}#{endpoint}?key=#{TOKEN}#{options.to_query.prepend("&")}",
        headers: {"Content-Type" => "application/json"}
      )
      {code: result.code, status: "Success", data: JSON.parse(result.body)}
    rescue RestClient::ExceptionWithResponse => error
      {code: error.http_code, status: error.message, data: Errors.map(error.http_code)}
    end
  end
end