require "rails_helper"

describe "github services" do
  context "get_repos" do
    it "returns an array of repo json objects" do
      token = ENV["github_user_token"]
      response = GithubService.new(token).get_repos

      expect(response).to be_a(Array)
      expect(response[0]).to have_key(:id)
      expect(response[0]).to have_key(:language)
      expect(response[0]).to have_key(:name)
      expect(response[0]).to have_key(:url)
    end
  end

  context "get_user" do
    it "returns a user's info" do
      token = ENV["github_user_token"]
      response = GithubService.new(token).get_user

      expect(response).to be_a(Hash)
      expect(response[:login]).to eq("AliSchlereth")
    end
  end
end
