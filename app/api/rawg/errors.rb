module Rawg
  class Errors
    def self.map code
      case code
      when 401
        return "Unauthorized Request"
      when 404
        return "Invalid Request"
      else
        return "Service Unavailable"
      end
    end
  end
end