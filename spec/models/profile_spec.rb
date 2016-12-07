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

  context "#find_followers" do
    it "returns a user's followers" do
      token = ENV["github_user_token"]
      followers = Profile.find_followers(token)

      expect(followers).to be_a(Array)
      expect(followers[0]).to be_a(Profile)
      expect(followers[0].joined_on).to be_truthy
    end
  end

  context "#find_following" do
    it "returns who a user is following" do
      token = ENV["github_user_token"]
      following = Profile.find_following(token)

      expect(following).to be_a(Array)
      expect(following[0]).to be_a(Profile)
      expect(following[0].joined_on).to be_truthy
    end
  end

end
