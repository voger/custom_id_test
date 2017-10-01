defmodule CustomIdTestWeb.PageController do
  use CustomIdTestWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
