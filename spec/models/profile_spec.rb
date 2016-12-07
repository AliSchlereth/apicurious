require "rails_helper"

describe "Profile" do
  context "#get_user" do
    it "returns a user's info" do
      token = ENV["github_user_token"]
      user = Profile.find_user(token)

      expect(user).to be_a(Profile)
      expect(user.name).to eq("Ali Schlereth")
      expect(user.email).to be_truthy
      expect(user.joined_on).to be_truthy
      expect(user.location).to be_truthy
    end
  end
end
