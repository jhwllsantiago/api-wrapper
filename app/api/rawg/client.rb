module Rawg
  class Client
    def self.index directory
      Request.call("get", "/#{directory}")
    end

    def self.show directory, id
      Request.call("get", "/#{directory}/#{id}")
    end

    def self.show_detail directory, id, sub_directory
      Request.call("get", "/#{directory}/#{id}/#{sub_directory}")
    end
  end
end