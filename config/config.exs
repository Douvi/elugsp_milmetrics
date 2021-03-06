# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :elugsp_milmetrics, ElugspMilmetrics.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "1hSYL1JliE7o6K1QovmIPRizzBUAyJpjvbekqyq3BmXyqYRafOgBjMVe33Qhzhf5",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: ElugspMilmetrics.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :elixometer, reporter: :exometer_report_influxdb,
                    update_frequency: 500,
                    env: Mix.env,
                    metric_prefix: "lukla"

config :exometer_core, report: [
  reporters: [
    exometer_report_influxdb: [
      protocol: :http,
      host: "localhost",
      port: 8086,
      db: "elugsp_milmetrics",
      tags: []
    ]
  ]
]
