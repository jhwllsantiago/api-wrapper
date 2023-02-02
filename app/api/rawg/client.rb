module Rawg
  class Client
    def self.creators
      Request.call("get", "/creators")
    end

    def self.creator_roles
      Request.call("get", "/creator-roles")
    end

    def self.show id
      Request.call("get", "/creators/#{id}")
    end
  end
end