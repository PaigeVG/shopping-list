defmodule ShoppingList.Repo.Migrations.AddObtainedColumnToListItem do
  use Ecto.Migration

  def change do
    alter table(:list_items) do
      add :obtained, :boolean, default: false
    end
  end
end
