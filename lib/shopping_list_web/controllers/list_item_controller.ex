defmodule ShoppingListWeb.ListItemController do
  use ShoppingListWeb, :controller

  alias ShoppingList.ShoppingLists
  alias ShoppingList.ShoppingLists.ListItem

  def index(conn, %{"list_id" => list_id}) do
    list_items = ShoppingLists.list_list_items()
    render(conn, "index.html", list_items: list_items, list_id: list_id)
  end

  def new(conn, %{"list_id" => list_id}) do
    changeset = ShoppingLists.change_list_item(%ListItem{})
    render(conn, "new.html", changeset: changeset, list_id: list_id)
  end

  def create(conn, %{"list_item" => list_item_params, "list_id" => list_id}) do
    list_item_params = Map.put(list_item_params, "list_id", list_id)

    case ShoppingLists.create_list_item(list_item_params) do
      {:ok, list_item} ->
        conn
        |> put_flash(:info, "List item created successfully.")
        |> redirect(to: Routes.list_list_item_path(conn, :show, list_id, list_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        IO.inspect(list_item_params)
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    list_item = ShoppingLists.get_list_item!(id)
    render(conn, "show.html", list_item: list_item)
  end

  def edit(conn, %{"id" => id}) do
    list_item = ShoppingLists.get_list_item!(id)
    changeset = ShoppingLists.change_list_item(list_item)
    render(conn, "edit.html", list_item: list_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "list_item" => list_item_params, "list_id" => list_id}) do
    list_item = ShoppingLists.get_list_item!(id)

    case ShoppingLists.update_list_item(list_item, list_item_params) do
      {:ok, list_item} ->
        conn
        |> put_flash(:info, "List item updated successfully.")
        |> redirect(to: Routes.list_list_item_path(conn, :show, list_id, list_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", list_item: list_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id, "list_id" => list_id}) do
    list_item = ShoppingLists.get_list_item!(id)
    {:ok, _list_item} = ShoppingLists.delete_list_item(list_item)

    conn
    |> put_flash(:info, "List item deleted successfully.")
    |> redirect(to: Routes.list_list_item_path(conn, :index, list_id))
  end
end
