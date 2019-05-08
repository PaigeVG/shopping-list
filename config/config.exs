# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :shopping_list,
  ecto_repos: [ShoppingList.Repo]

# Configures the endpoint
config :shopping_list, ShoppingListWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "h2Ye1CIEh9hSS3qNXJ9uwLOlodXCiP/pYWiKKVeUIbeuwJEs7ikg1b61THBRnRwx",
  render_errors: [view: ShoppingListWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ShoppingList.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, []}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: ("9bc2358337302244aaae"),
  client_secret: ("61ab331c864c76189118095811a30016387f4c5b")
