defmodule AuthElixirWeb.PageController do
  use AuthElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
