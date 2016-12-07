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

  context "find_followers" do
    it "returns a user's follower" do
      token = ENV["github_user_token"]
      response = GithubService.new(token).get_followers

      expect(response).to be_a(Array)
      expect(response[0]).to have_key(:login)
    end
  end

  context "find_following" do
    it "returns a user's follower" do
      token = ENV["github_user_token"]
      response = GithubService.new(token).get_following

      expect(response).to be_a(Array)
      expect(response[0]).to have_key(:login)
    end
  end

  context "get starred" do
    it "returns user's starred repositories" do
      token = ENV["github_user_token"]
      response = GithubService.new(token).get_starred

      expect(response).to be_a(Array)
      expect(response[0]).to have_key(:name)
    end
  end

  context "get a users events" do
    it "returns all events for a user" do
      token = ENV["github_user_token"]
      response = GithubService.new(token).get_user_events("AliSchlereth")

      expect(response).to be_an(Array)
      expect(response[0]).to have_key(:type)
    end
  end

  context "get rcvd events" do
    it "returns all received events for a user" do
      token = ENV["github_user_token"]
      response = GithubService.new(token).get_rcvd_events("AliSchlereth")

      expect(response).to be_an(Array)
      expect(response[0]).to have_key(:type)
    end
  end

  context "get_organizations" do
    it "returns an array of a users organizations" do
      token = ENV["github_user_token"]
      response = GithubService.new(token).get_organizations

      expect(response).to be_a(Array)
      expect(response[0]).to have_key(:login)
    end
  end


end
