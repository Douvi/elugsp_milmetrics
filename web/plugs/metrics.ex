defmodule ElugspMilmetrics.Plug.Metrics do
  @behaviour Plug

  use Elixometer
  import Plug.Conn, only: [register_before_send: 2]

  @unit :milli_seconds

  def init(opts), do: opts
  def call(conn, _config) do
    req_start_time = :erlang.monotonic_time(@unit)

    register_before_send conn, fn conn ->
      request_duration = elapsed_time(req_start_time, @unit)

      update_counter("request_count", 1)
      update_gauge(metric_name(conn), request_duration)

      conn
    end
  end

  defp elapsed_time(req_start_time, unit) do
    :erlang.monotonic_time(unit) - req_start_time
  end

  defp metric_name(conn) do
    action_name = Phoenix.Controller.action_name(conn)
    controller  = Phoenix.Controller.controller_module(conn)
    "#{controller}\##{action_name}"
  end
end
