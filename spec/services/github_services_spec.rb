require "rails_helper"

describe "github services" do
  context "get_repos" do
    it "returns an array of repo json objects" do
      response = GithubService.new.get_repos("AliSchlereth")

      expect(response).to be_a(Array)
      expect(response[0]).to have_key(:id)
      expect(response[0]).to have_key(:language)
      expect(response[0]).to have_key(:name)
      expect(response[0]).to have_key(:url)
    end
  end

  context "get_user" do
    it "returns a user's info" do
      response = GithubService.new.get_user("AliSchlereth")

      expect(response).to be_a(Hash)
      expect(response[:login]).to eq("AliSchlereth")
    end
  end
end
