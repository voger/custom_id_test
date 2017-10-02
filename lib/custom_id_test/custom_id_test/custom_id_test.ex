defmodule CustomIdTest.CustomIdTest do
  @moduledoc """
  The CustomIdTest context.
  """

  import Ecto.Query, warn: false
  alias CustomIdTest.Repo

  alias CustomIdTest.ThingWihChangeset

  @doc """
  Returns the list of things_with_changeset.

  ## Examples

      iex> list_things_with_changeset()
      [%ThingWihChangeset{}, ...]

  """
  def list_things_with_changeset do
    Repo.all(ThingWihChangeset)
  end

  @doc """
  Gets a single thing_wih_changeset.

  Raises `Ecto.NoResultsError` if the Thing wih changeset does not exist.

  ## Examples

      iex> get_thing_wih_changeset!(123)
      %ThingWihChangeset{}

      iex> get_thing_wih_changeset!(456)
      ** (Ecto.NoResultsError)

  """
  def get_thing_wih_changeset!(id), do: Repo.get!(ThingWihChangeset, id)

  @doc """
  Creates a thing_wih_changeset.

  ## Examples

      iex> create_thing_wih_changeset(%{field: value})
      {:ok, %ThingWihChangeset{}}

      iex> create_thing_wih_changeset(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_thing_wih_changeset(attrs \\ %{}) do
    %ThingWihChangeset{}
    |> ThingWihChangeset.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a thing_wih_changeset.

  ## Examples

      iex> update_thing_wih_changeset(thing_wih_changeset, %{field: new_value})
      {:ok, %ThingWihChangeset{}}

      iex> update_thing_wih_changeset(thing_wih_changeset, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_thing_wih_changeset(%ThingWihChangeset{} = thing_wih_changeset, attrs) do
    thing_wih_changeset
    |> ThingWihChangeset.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ThingWihChangeset.

  ## Examples

      iex> delete_thing_wih_changeset(thing_wih_changeset)
      {:ok, %ThingWihChangeset{}}

      iex> delete_thing_wih_changeset(thing_wih_changeset)
      {:error, %Ecto.Changeset{}}

  """
  def delete_thing_wih_changeset(%ThingWihChangeset{} = thing_wih_changeset) do
    Repo.delete(thing_wih_changeset)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking thing_wih_changeset changes.

  ## Examples

      iex> change_thing_wih_changeset(thing_wih_changeset)
      %Ecto.Changeset{source: %ThingWihChangeset{}}

  """
  def change_thing_wih_changeset(%ThingWihChangeset{} = thing_wih_changeset) do
    ThingWihChangeset.changeset(thing_wih_changeset, %{})
  end
end
