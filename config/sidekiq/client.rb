# frozen_string_literal: true

require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] || 'redis://redis:6379', network_timeout: 20 }
end
