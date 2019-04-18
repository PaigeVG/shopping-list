defmodule ShoppingList.Repo do
  use Ecto.Repo,
    otp_app: :shopping_list,
    adapter: Ecto.Adapters.Postgres
end
