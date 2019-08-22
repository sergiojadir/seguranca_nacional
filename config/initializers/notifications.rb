# Track requests from a special user agent.
Rack::Attack.track("special_agent") do |req|
  req.user_agent == "SpecialAgent"
end

# Supports optional limit and period, triggers the notification only when the limit is reached.
Rack::Attack.track("special_agent", limit: 6, period: 60) do |req|
  req.user_agent == "SpecialAgent"
end

# Track it using ActiveSupport::Notification
ActiveSupport::Notifications.subscribe("track.rack_attack") do |name, start, finish, request_id, payload|
  req = payload[:request]
  if req.env['rack.attack.matched'] == "special_agent"
    Rails.logger.info "special_agent: #{req.path}"
    STATSD.increment("special_agent")
  end
end