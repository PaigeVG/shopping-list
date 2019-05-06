defmodule ShoppingList.ShoppingLists.List do
  use Ecto.Schema
  import Ecto.Changeset

  alias ShoppingList.ShoppingLists

  schema "lists" do
    field :name, :string

    has_many :list_items, ShoppingLists.ListItem
    belongs_to :user, ShoppingList.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name])
  end
end
