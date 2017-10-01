defmodule CustomIdTest.EntryFragment do
  use Ecto.Schema

  import Ecto.Changeset

  alias CustomIdTest.EntryFragment

  @primary_key {:id, :integer, []}
  @derive {Phoenix.Param, key: :id}
  schema "entry_fragment" do
    field :entry, :string
  end


  def create_changeset(%EntryFragment{} = struct, params \\ %{}) do
    struct
    |> cast(params, [:entry])
    |> validate_required([:entry])
  end
end
