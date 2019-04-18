defmodule ShoppingList.Repo.Migrations.CreateSpaces do
  use Ecto.Migration

  def change do
    create table(:spaces) do
      add :user_id, references("users")
      add :name, :string

      timestamps()
    end
  end
end
