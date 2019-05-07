defmodule ShoppingListWeb.PageController do
  use ShoppingListWeb, :controller

  plug :redirect_if_signed_in, []

  def index(conn, _params) do
    render(conn, "index.html")
  end

  defp redirect_if_signed_in(conn, _opts) do
    if signed_in?(conn) do
      redirect(conn, to: Routes.list_path(conn, :index))
    else
      conn
    end
  end
end
