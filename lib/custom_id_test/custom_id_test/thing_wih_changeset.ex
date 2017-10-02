defmodule CustomIdTest.ThingWihChangeset do
  use Ecto.Schema
  import Ecto.Changeset
  alias CustomIdTest.ThingWihChangeset

  @primary_key {:id, :id, autogenerate: false}


  schema "things_with_changeset" do
    field :entry, :string

    timestamps()
  end

  @doc false
  def changeset(%ThingWihChangeset{} = thing_wih_changeset, attrs) do
    thing_wih_changeset
    |> cast(attrs, [:entry])
    |> validate_required([:entry])
    |> put_change(:id, get_current_unix_time())
  end

  defp get_current_unix_time do
    DateTime.utc_now() |> DateTime.to_unix()
  end
end
