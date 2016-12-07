class Event
  attr_reader :username, :type, :repo, :created_at

  def initialize(attributes)
    @username = attributes[:actor][:login]
    @type = attributes[:type]
    @repo = attributes[:repo][:name]
    @created_at = attributes[:created_at]
  end

  def self.by_user(token, username)
    service = GithubService.new(token)
    service.get_user_events(username).map do |event_info|
      Event.new(event_info)
    end
  end

  def self.rcvd_by_user(token, username)
    service = GithubService.new(token)
    service.get_rcvd_events(username).map do |event_info|
      Event.new(event_info)
    end
  end

end
