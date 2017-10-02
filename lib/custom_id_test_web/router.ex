defmodule CustomIdTestWeb.Router do
  use CustomIdTestWeb, :router

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

  scope "/", CustomIdTestWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/things_with_changeset", ThingWihChangesetController
  end

  # Other scopes may use custom stacks.
  # scope "/api", CustomIdTestWeb do
  #   pipe_through :api
  # end
end
