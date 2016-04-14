# defmodule ElugspMilmetrics.Plug.Metrics do
#   @behaviour Plug

#   use Elixometer
#   import Plug.Conn, only: [register_before_send: 2]

#   def init(opts), do: opts

#   @timed(key: "request_time")
#   def call(conn, _config) do
#     register_before_send conn, fn conn ->
#       update_counter("request_count", 1)
#       conn
#     end
#   end
# end
