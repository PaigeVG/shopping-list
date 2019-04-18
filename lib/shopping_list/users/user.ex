defmodule ShoppingList.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias ShoppingList.ShoppingLists

  schema "users" do
    field :email, :string

    timestamps()

    has_one :space, ShoppingLists.Space
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:email])
    |> validate_required([:email])
  end
end
