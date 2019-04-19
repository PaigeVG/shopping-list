defmodule ShoppingListWeb.SpaceController do
  use ShoppingListWeb, :controller

  alias ShoppingList.ShoppingLists
  alias ShoppingList.ShoppingLists.Space

  ## Implies our incoming parmas should have a key called "space".

  def index(conn, _params) do
    spaces = ShoppingLists.list_spaces()
    render(conn, "index.html", spaces: spaces)
  end

  def create(conn, %{"space" => space_params}) do
    case ShoppingLists.create_space(space_params) do
      {:ok, space} ->
        conn
        |> put_flash(:info, "Space created successfully.")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:info, "Oops, that didn't work.")
        |> redirect(to: "/")
    end
  end
end
