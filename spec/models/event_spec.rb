require "rails_helper"

describe "Event" do
  it "returns an array of events for a user" do
    token = ENV["github_user_token"]
    events = Event.by_user(token, "AliSchlereth")

    expect(events).to be_a(Array)
    expect(events[0]).to be_a(Event)
    expect(events[0].username).to be_truthy
    expect(events[0].type).to be_truthy
    expect(events[0].repo).to be_truthy
    expect(events[0].created_at).to be_truthy
  end

  it "returns an array of events for a user" do
    token = ENV["github_user_token"]
    events = Event.rcvd_by_user(token, "AliSchlereth")

    expect(events).to be_a(Array)
    expect(events[0]).to be_a(Event)
    expect(events[0].username).to be_truthy
    expect(events[0].type).to be_truthy
    expect(events[0].repo).to be_truthy
    expect(events[0].created_at).to be_truthy
  end

end
