defmodule ShoppingList.ShoppingLists.List do
  use Ecto.Schema
  import Ecto.Changeset

  alias ShoppingList.ShoppingLists

  schema "lists" do
    field :name, :string

    timestamps()

    has_many :list_items, ShoppingLists.ListItem
    belongs_to :space, ShoppingLists.Space
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
