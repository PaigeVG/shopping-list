defmodule ShoppingList.Repo.Migrations.CreateListItems do
  use Ecto.Migration

  def change do
    create table(:list_items) do
      add :list_id, references("lists")
      add :item_name, references("items", column: :name, type: :string)
      add :quantity, :integer

      timestamps()
    end

  end
end
