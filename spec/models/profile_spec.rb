require "rails_helper"

describe "Profile" do
  context "#get_user" do
    it "returns a user's info", :vcr do
      token = ENV["github_user_token"]
      user = Profile.find_user(token)

      expect(user).to be_a(Profile)
      expect(user.name).to eq("Ali Schlereth")
      expect(user).to respond_to(:email)
      expect(user).to respond_to(:joined_on)
      expect(user).to respond_to(:location)
    end
  end

  context "#find_followers" do
    it "returns a user's followers", :vcr do
      token = ENV["github_user_token"]
      followers = Profile.find_followers(token)

      expect(followers).to be_a(Array)
      expect(followers[0]).to be_a(Profile)
      expect(followers[0]).to respond_to(:joined_on)
    end
  end

  context "#find_following" do
    it "returns who a user is following", :vcr do
      token = ENV["github_user_token"]
      following = Profile.find_following(token)

      expect(following).to be_a(Array)
      expect(following[0]).to be_a(Profile)
      expect(following[0]).to respond_to(:joined_on)
    end
  end

end
