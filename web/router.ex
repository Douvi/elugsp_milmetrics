defmodule ElugspMilmetrics.Router do
  use ElugspMilmetrics.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElugspMilmetrics do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/milhappy", PageController, :milhappy
    get "/milsad", PageController, :milsad
    get "/mil_so_sad", PageController, :mil_so_sad
  end
end
