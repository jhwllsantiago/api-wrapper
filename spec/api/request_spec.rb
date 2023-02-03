require "rails_helper"

describe Rawg::Request do
  before do
    TOKEN = Rails.application.credentials.api_key.rawg
    response = double(Object)
    allow(response).to receive(:code).and_return(200)
    allow(response).to receive(:body).and_return("")
    allow(JSON).to receive(:parse).and_return("")
    allow(RestClient::Request).to receive(:execute).and_return(response)
  end

  it "sends well-formed request" do
    params = {
      method: "get",
      url: "https://api.rawg.io/api/endpoint?key=#{TOKEN}",
      headers: {"Content-Type"=>"application/json"}
    }
    expect(RestClient::Request).to receive(:execute).with(params)
    Rawg::Request.call("get", "/endpoint")

    params[:url] += "&page=2"
    expect(RestClient::Request).to receive(:execute).with(params)
    Rawg::Request.call("get", "/endpoint", {page: 2})
  end
end