defmodule ShoppingListWeb.ListView do
  use ShoppingListWeb, :view

  def toggle_route(conn, list_item) do
    Routes.list_list_item_path(
      conn,
      :toggle_obtained,
      list_item.list_id,
      list_item,
      _csrf_token: get_csrf_token()
    )
  end
end
