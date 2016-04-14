defmodule ElugspMilmetrics.PageController do
  use ElugspMilmetrics.Web, :controller

  use Elixometer

  def index(conn, _params) do
    :timer.sleep(150)
    render conn, "index.html"
  end

  def milhappy(conn, _params) do
    time = 100 + :rand.uniform(20)
    :timer.sleep(time)

    render conn, "milhappy.html"
  end

  def milsad(conn, _params) do
    time = 80 + :rand.uniform(130)
    :timer.sleep(time)

    render conn, "milsad.html"
  end

  def mil_so_sad(conn, _params) do
    time = 8000 + :rand.uniform(13000)
    :timer.sleep(time)

    render conn, "milsad.html"
  end
end
