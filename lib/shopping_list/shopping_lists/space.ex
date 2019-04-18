defmodule ShoppingList.ShoppingLists.Space do
  use Ecto.Schema
  import Ecto.Changeset

  alias ShoppingList.ShoppingLists

  schema "spaces" do
    field :name, :string

    timestamps()

    has_many :lists, ShoppingLists.List
    belongs_to :user, ShoppingList.Users.User
  end

  @doc false
  def changeset(space, attrs) do
    space
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
