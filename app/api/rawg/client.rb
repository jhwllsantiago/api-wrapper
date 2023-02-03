module Rawg
  class Client
    def self.get *args, query: {}
      Request.call("get", self.build_endpoint(args), query)
    end

    private
    def self.build_endpoint args
      args.reduce("") do |endpoint, arg|
        endpoint += "#{arg.prepend("/")}"
      end
    end
  end
end