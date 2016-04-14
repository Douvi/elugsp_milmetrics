defmodule Mix.Tasks.Influx.Create do
  use Mix.Task

  @shortdoc "creates the influxdb database"
  def run(_args) do
    Application.ensure_all_started(:hackney)

    exometer_report_conf = Application.get_env(:exometer_core, :report)
    influxdb_conf = get_in exometer_report_conf, [:reporters, :exometer_report_influxdb]

    endpoint = "#{influxdb_conf[:protocol]}://#{influxdb_conf[:host]}:#{influxdb_conf[:port]}"
    query = "query?q=CREATE%20DATABASE%20#{influxdb_conf[:db]}"

    url = "#{endpoint}/#{query}"

    {:ok, status, _, clientref} = :hackney.request(:get, url, [], "", [])
    {:ok, body}                 = :hackney.body(clientref)

    IO.puts "response: #{status}"
    IO.puts body
  end
end
