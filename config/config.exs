# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :custom_id_test,
  ecto_repos: [CustomIdTest.Repo]

# Configures the endpoint
config :custom_id_test, CustomIdTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "b96AyVfNHYd96LTA8Zj9VpBP1w+ibeNLA46QbNESqUQOcaWW0+bwa+SmUT3lgMOx",
  render_errors: [view: CustomIdTestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CustomIdTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
