defmodule ShoppingList.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items, primary_key: false) do
      add :name, :string, primary_key: true
      add :section, :string

      timestamps()
    end

  end
end
