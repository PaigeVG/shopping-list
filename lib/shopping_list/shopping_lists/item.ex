defmodule ShoppingList.ShoppingLists.Item do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:name, :string, autogenerate: false}

  alias ShoppingList.ShoppingLists

  schema "items" do
    field :section, :string

    timestamps()

    has_many :list_items, ShoppingLists.ListItem,
      foreign_key: :item_name,
      references: :name
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :section])
    |> validate_required([:name, :section])
  end
end
