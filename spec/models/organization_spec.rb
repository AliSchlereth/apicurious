require "rails_helper"

describe "Organization" do
  context "#by_user" do
    it "returns an array of organizations for a user" do
      token = ENV["github_user_token"]
      orgs = Organization.by_user(token)

      expect(orgs).to be_a(Array)
      expect(orgs[0].name).to be_truthy
      expect(orgs[0].url).to be_truthy
      expect(orgs[0].img).to be_truthy
    end
  end
end
