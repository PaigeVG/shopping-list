defmodule ShoppingListWeb.ItemController do
  use ShoppingListWeb, :controller

  alias ShoppingList.ShoppingLists
  alias ShoppingList.ShoppingLists.Item

  def index(conn, _params) do
    items = ShoppingLists.list_items()
    render(conn, "index.html", items: items)
  end

  def new(conn, _params) do
    changeset = ShoppingLists.change_item(%Item{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"item" => item_params}) do
    case ShoppingLists.create_item(item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item created successfully.")
        |> redirect(to: Routes.item_path(conn, :show, item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"name" => name}) do
    item = ShoppingLists.get_item!(name)
    render(conn, "show.html", item: item)
  end

  def edit(conn, %{"name" => name}) do
    item = ShoppingLists.get_item!(name)
    changeset = ShoppingLists.change_item(item)
    render(conn, "edit.html", item: item, changeset: changeset)
  end

  def update(conn, %{"name" => name, "item" => item_params}) do
    item = ShoppingLists.get_item!(name)

    case ShoppingLists.update_item(item, item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item updated successfully.")
        |> redirect(to: Routes.item_path(conn, :show, item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", item: item, changeset: changeset)
    end
  end

  def delete(conn, %{"name" => name}) do
    item = ShoppingLists.get_item!(name)
    {:ok, _item} = ShoppingLists.delete_item(item)

    conn
    |> put_flash(:info, "Item deleted successfully.")
    |> redirect(to: Routes.item_path(conn, :index))
  end
end
