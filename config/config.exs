# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :auth_elixir,
  ecto_repos: [AuthElixir.Repo]

# Configures the endpoint
config :auth_elixir, AuthElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vg8gmOgFsZst54y9uhB9Rd/nWn8+jasq14rMg1tUhUo+06bxx0oOD2wGdA1R+3PT",
  render_errors: [view: AuthElixirWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: AuthElixir.PubSub,
  live_view: [signing_salt: "qq+qZ551"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
