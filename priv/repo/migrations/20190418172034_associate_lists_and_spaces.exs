defmodule ShoppingList.Repo.Migrations.AssociateListsAndSpaces do
  use Ecto.Migration

  def change do
    alter table(:lists) do
      add :space_id, references("spaces")
    end
  end
end
