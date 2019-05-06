defmodule ShoppingList.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bcrypt

  schema "users" do
    field :encrypted_password, :string
    field :username, :string

    has_many :lists, ShoppingList.ShoppingLists.List

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :encrypted_password])
    |> validate_required([:username, :encrypted_password])
    |> unique_constraint(:username)
    |> update_change(:encrypted_password, &Bcrypt.hash_pwd_salt/1)
  end
end
