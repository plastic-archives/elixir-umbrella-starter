import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :web_api, WebApi.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "xp54gF1WxPx9Dy//V2NG6+2wCtvf9AJrEsc6daTr6LgyBb0NpEjucrEQgV3MUws0",
  server: false

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :core, Core.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "core_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10
