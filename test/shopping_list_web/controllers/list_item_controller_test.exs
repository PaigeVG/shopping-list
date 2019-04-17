defmodule ShoppingListWeb.ListItemControllerTest do
  use ShoppingListWeb.ConnCase

  alias ShoppingList.ShoppingLists

  @create_attrs %{item: "some item", quantity: 42}
  @update_attrs %{item: "some updated item", quantity: 43}
  @invalid_attrs %{item: nil, quantity: nil}

  def fixture(:list_item) do
    {:ok, list_item} = ShoppingLists.create_list_item(@create_attrs)
    list_item
  end

  describe "index" do
    test "lists all list_items", %{conn: conn} do
      conn = get(conn, Routes.list_item_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing List items"
    end
  end

  describe "new list_item" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.list_item_path(conn, :new))
      assert html_response(conn, 200) =~ "New List item"
    end
  end

  describe "create list_item" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.list_item_path(conn, :create), list_item: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.list_item_path(conn, :show, id)

      conn = get(conn, Routes.list_item_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show List item"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.list_item_path(conn, :create), list_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "New List item"
    end
  end

  describe "edit list_item" do
    setup [:create_list_item]

    test "renders form for editing chosen list_item", %{conn: conn, list_item: list_item} do
      conn = get(conn, Routes.list_item_path(conn, :edit, list_item))
      assert html_response(conn, 200) =~ "Edit List item"
    end
  end

  describe "update list_item" do
    setup [:create_list_item]

    test "redirects when data is valid", %{conn: conn, list_item: list_item} do
      conn = put(conn, Routes.list_item_path(conn, :update, list_item), list_item: @update_attrs)
      assert redirected_to(conn) == Routes.list_item_path(conn, :show, list_item)

      conn = get(conn, Routes.list_item_path(conn, :show, list_item))
      assert html_response(conn, 200) =~ "some updated item"
    end

    test "renders errors when data is invalid", %{conn: conn, list_item: list_item} do
      conn = put(conn, Routes.list_item_path(conn, :update, list_item), list_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit List item"
    end
  end

  describe "delete list_item" do
    setup [:create_list_item]

    test "deletes chosen list_item", %{conn: conn, list_item: list_item} do
      conn = delete(conn, Routes.list_item_path(conn, :delete, list_item))
      assert redirected_to(conn) == Routes.list_item_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.list_item_path(conn, :show, list_item))
      end
    end
  end

  defp create_list_item(_) do
    list_item = fixture(:list_item)
    {:ok, list_item: list_item}
  end
end
