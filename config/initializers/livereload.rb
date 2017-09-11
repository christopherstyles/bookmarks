if Rails.env.development?
  Rails.application.config.middleware.insert_after(
    ActionDispatch::Static,
    Rack::LiveReload,
    # {
    #   live_reload_port: 35730,  # default 35729
    # }
  )
end
