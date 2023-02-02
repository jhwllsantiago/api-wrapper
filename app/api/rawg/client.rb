module Rawg
  class Client
    def self.index directory
      Request.call("get", "/#{directory}")
    end

    def self.show directory, id
      Request.call("get", "/#{directory}/#{id}")
    end
  end
end