require "rails_helper"

describe "Event" do
  it "returns an array of events for a user" do
    token = ENV["github_user_token"]
    events = Event.by_user(token, "AliSchlereth")

    expect(events).to be_a(Array)
    expect(events[0]).to be_a(Event)
    expect(events[0]).to respond_to(:username)
    expect(events[0]).to respond_to(:type)
    expect(events[0]).to respond_to(:repo)
    expect(events[0]).to respond_to(:created_at)
  end

  it "returns an array of events for a user" do
    token = ENV["github_user_token"]
    events = Event.rcvd_by_user(token, "AliSchlereth")

    expect(events).to be_a(Array)
    expect(events[0]).to be_a(Event)
    expect(events[0]).to respond_to(:username)
    expect(events[0]).to respond_to(:type)
    expect(events[0]).to respond_to(:repo)
    expect(events[0]).to respond_to(:created_at)
  end

end
