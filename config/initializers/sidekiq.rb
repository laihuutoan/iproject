require 'sidekiq/cli'

Sidekiq.configure_server do |config|
  config.redis = { db: 1, url: 'redis://localhost:6379/0', namespace: "sidekiq_iproject_#{Rails.env}" }
end

Sidekiq.configure_client do |config|
  config.redis = { db: 1, url: 'redis://localhost:6379/0', namespace: "sidekiq_iproject_#{Rails.env}" }
end
