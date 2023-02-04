require "rails_helper"
require "vcr_helper"

describe Rawg::Client, vcr: true do
  it "shows games index" do
    VCR.use_cassette("games") do
      response = Rawg::Client.get("games")
      expect(response[:code]).to eq 200
      expect(response[:data]["results"].count).to eq 20
      expect(response[:data]["results"].first.is_a?(Hash)).to eq true
    end
  end

  it "shows specific game" do
    VCR.use_cassette("game") do
      response = Rawg::Client.get("games", "3328")
      expect(response[:code]).to eq 200
      expect(response[:data].is_a?(Hash)).to eq true
      expect(response[:data]["id"]).to eq 3328
    end
  end

  it "shows specific game screenshots" do
    VCR.use_cassette("game_screenshots") do
      response = Rawg::Client.get("games", "3328", "screenshots")
      expect(response[:code]).to eq 200
      expect(response[:data]["results"].first.is_a?(Hash)).to eq true
    end
  end

  it "shows 'not found' error" do
    VCR.use_cassette("invalid_request") do
      response = Rawg::Client.get("pneumonoultramicroscopicsilicovolcanoconiosis")
      expect(response[:code]).to eq 404
      expect(response[:data].is_a?(String)).to eq true
      expect(response[:data]["results"]).to eq nil
    end
  end
end