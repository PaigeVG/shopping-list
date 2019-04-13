defmodule ShoppingList.ShoppingLists.ListItem do
  use Ecto.Schema
  import Ecto.Changeset

  alias ShoppingList.ShoppingLists

  schema "list_items" do
    field :quantity, :integer

    timestamps()

    belongs_to :item, ShoppingLists.Item,
      foreign_key: :item_name,
      references: :name,
      type: :string

    belongs_to :list, ShoppingLists.List
  end

  @doc false
  def changeset(list_item, attrs) do
    list_item
    |> cast(attrs, [:item_name, :quantity])
    |> validate_required([:item_name, :quantity])
  end
end
