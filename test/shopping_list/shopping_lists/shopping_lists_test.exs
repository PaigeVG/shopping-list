defmodule ShoppingList.ShoppingListsTest do
  use ShoppingList.DataCase

  alias ShoppingList.ShoppingLists

  describe "lists" do
    alias ShoppingList.ShoppingLists.List

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def list_fixture(attrs \\ %{}) do
      {:ok, list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ShoppingLists.create_list()

      list
    end

    test "list_lists/0 returns all lists" do
      list = list_fixture()
      assert ShoppingLists.list_lists() == [list]
    end

    test "get_list!/1 returns the list with given id" do
      list = list_fixture()
      assert ShoppingLists.get_list!(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      assert {:ok, %List{} = list} = ShoppingLists.create_list(@valid_attrs)
      assert list.name == "some name"
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ShoppingLists.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      assert {:ok, %List{} = list} = ShoppingLists.update_list(list, @update_attrs)
      assert list.name == "some updated name"
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = ShoppingLists.update_list(list, @invalid_attrs)
      assert list == ShoppingLists.get_list!(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = ShoppingLists.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> ShoppingLists.get_list!(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = ShoppingLists.change_list(list)
    end
  end

  describe "list_items" do
    alias ShoppingList.ShoppingLists.ListItem

    @valid_attrs %{item: "some item", quantity: 42}
    @update_attrs %{item: "some updated item", quantity: 43}
    @invalid_attrs %{item: nil, quantity: nil}

    def list_item_fixture(attrs \\ %{}) do
      {:ok, list_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ShoppingLists.create_list_item()

      list_item
    end

    test "list_list_items/0 returns all list_items" do
      list_item = list_item_fixture()
      assert ShoppingLists.list_list_items() == [list_item]
    end

    test "get_list_item!/1 returns the list_item with given id" do
      list_item = list_item_fixture()
      assert ShoppingLists.get_list_item!(list_item.id) == list_item
    end

    test "create_list_item/1 with valid data creates a list_item" do
      assert {:ok, %ListItem{} = list_item} = ShoppingLists.create_list_item(@valid_attrs)
      assert list_item.item == "some item"
      assert list_item.quantity == 42
    end

    test "create_list_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ShoppingLists.create_list_item(@invalid_attrs)
    end

    test "update_list_item/2 with valid data updates the list_item" do
      list_item = list_item_fixture()
      assert {:ok, %ListItem{} = list_item} = ShoppingLists.update_list_item(list_item, @update_attrs)
      assert list_item.item == "some updated item"
      assert list_item.quantity == 43
    end

    test "update_list_item/2 with invalid data returns error changeset" do
      list_item = list_item_fixture()
      assert {:error, %Ecto.Changeset{}} = ShoppingLists.update_list_item(list_item, @invalid_attrs)
      assert list_item == ShoppingLists.get_list_item!(list_item.id)
    end

    test "delete_list_item/1 deletes the list_item" do
      list_item = list_item_fixture()
      assert {:ok, %ListItem{}} = ShoppingLists.delete_list_item(list_item)
      assert_raise Ecto.NoResultsError, fn -> ShoppingLists.get_list_item!(list_item.id) end
    end

    test "change_list_item/1 returns a list_item changeset" do
      list_item = list_item_fixture()
      assert %Ecto.Changeset{} = ShoppingLists.change_list_item(list_item)
    end
  end

  describe "items" do
    alias ShoppingList.ShoppingLists.Item

    @valid_attrs %{name: "some name", section: "some section"}
    @update_attrs %{name: "some updated name", section: "some updated section"}
    @invalid_attrs %{name: nil, section: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ShoppingLists.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert ShoppingLists.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert ShoppingLists.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = ShoppingLists.create_item(@valid_attrs)
      assert item.name == "some name"
      assert item.section == "some section"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ShoppingLists.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = ShoppingLists.update_item(item, @update_attrs)
      assert item.name == "some updated name"
      assert item.section == "some updated section"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = ShoppingLists.update_item(item, @invalid_attrs)
      assert item == ShoppingLists.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = ShoppingLists.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> ShoppingLists.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = ShoppingLists.change_item(item)
    end
  end
end
