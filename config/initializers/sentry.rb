Sentry.init do |config|
    config.dsn = 'https://d73e8202201c46ee8368e33cb8df0d0c@o1356965.ingest.sentry.io/6643019'
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  
    # To activate performance monitoring, set one of these options.
    # We recommend adjusting the value in production:
    config.traces_sample_rate = 1.0
    # or
    config.traces_sampler = lambda do |context|
      true
    end
  end