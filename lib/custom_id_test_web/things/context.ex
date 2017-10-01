defmodule CustomIdTest.Context do
  alias CustomIdTest.EntryFragment
  alias CustomIdTest.Repo

  def create_entry(params) do
   EntryFragment.create_changeset(%EntryFragment{}, params)
   |> Repo.insert()
 end

  def get_entries(), do: Repo.all(EntryFragment)
end
