require "rails_helper"

describe "Organization" do
  context "#by_user" do
    it "returns an array of organizations for a user", :vcr do
      token = ENV["github_user_token"]
      orgs = Organization.by_user(token)

      expect(orgs).to be_a(Array)
      expect(orgs[0]).to respond_to(:name)
      expect(orgs[0]).to respond_to(:url)
      expect(orgs[0]).to respond_to(:img)
    end
  end
end
