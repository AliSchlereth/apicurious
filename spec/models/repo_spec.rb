require "rails_helper"

describe "Repo" do
  context ".get_repos" do
    it "returns instance of Repo" do
      token = ENV["github_user_token"]
      repos = Repo.find_by_user(token)

      expect(repos).to be_a(Array)
      expect(repos[0]).to be_a(Repo)
      expect(repos[0].id).to be_truthy
      expect(repos[0].name).to be_truthy
      expect(repos[0].language).to be_truthy
      expect(repos[0].url).to be_truthy
    end
  end
end
