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
end
