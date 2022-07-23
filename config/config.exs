# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :dashboard,
  ecto_repos: [Core.Repo],
  generators: [context_app: false, binary_id: true]

# Configures the endpoint
config :dashboard, Dashboard.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: Dashboard.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Dashboard.PubSub,
  live_view: [signing_salt: "enH9JqdY"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/dashboard/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :web_api,
  ecto_repos: [Core.Repo],
  generators: [context_app: false, binary_id: true]

# Configures the endpoint
config :web_api, WebApi.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: WebApi.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: WebApi.PubSub,
  live_view: [signing_salt: "sjWuzTlr"]

# Configure Mix tasks and generators
config :core,
  ecto_repos: [Core.Repo]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :core, Core.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
