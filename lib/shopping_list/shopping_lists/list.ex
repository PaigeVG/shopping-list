defmodule ShoppingList.ShoppingLists.List do
  use Ecto.Schema
  import Ecto.Changeset

  alias ShoppingList.ShoppingLists

  schema "lists" do
    field :name, :string

    timestamps()


    
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
