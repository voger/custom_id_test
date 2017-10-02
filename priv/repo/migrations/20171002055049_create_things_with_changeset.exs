defmodule CustomIdTest.Repo.Migrations.CreateThingsWithChangeset do
  use Ecto.Migration

  def change do

    create table(:things_with_changeset, primary_key: false) do
      add :id, :id, primary_key: true
      add :entry, :string

      timestamps()
    end

  end
end
