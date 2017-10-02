defmodule CustomIdTestWeb.ThingWihChangesetController do
  use CustomIdTestWeb, :controller

  alias CustomIdTest.CustomIdTest, as: CIT
  alias CustomIdTest.ThingWihChangeset

  def index(conn, _params) do
    things_with_changeset = CIT.list_things_with_changeset()
    render(conn, "index.html", things_with_changeset: things_with_changeset)
  end

  def new(conn, _params) do
    changeset = CIT.change_thing_wih_changeset(%ThingWihChangeset{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"thing_wih_changeset" => thing_wih_changeset_params}) do
    case CIT.create_thing_wih_changeset(thing_wih_changeset_params) do
      {:ok, thing_wih_changeset} ->
        conn
        |> put_flash(:info, "Thing wih changeset created successfully.")
        |> redirect(to: thing_wih_changeset_path(conn, :show, thing_wih_changeset))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    thing_wih_changeset = CIT.get_thing_wih_changeset!(id)
    render(conn, "show.html", thing_wih_changeset: thing_wih_changeset)
  end

  def edit(conn, %{"id" => id}) do
    thing_wih_changeset = CIT.get_thing_wih_changeset!(id)
    changeset = CIT.change_thing_wih_changeset(thing_wih_changeset)
    render(conn, "edit.html", thing_wih_changeset: thing_wih_changeset, changeset: changeset)
  end

  def update(conn, %{"id" => id, "thing_wih_changeset" => thing_wih_changeset_params}) do
    thing_wih_changeset = CIT.get_thing_wih_changeset!(id)

    case CIT.update_thing_wih_changeset(thing_wih_changeset, thing_wih_changeset_params) do
      {:ok, thing_wih_changeset} ->
        conn
        |> put_flash(:info, "Thing wih changeset updated successfully.")
        |> redirect(to: thing_wih_changeset_path(conn, :show, thing_wih_changeset))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", thing_wih_changeset: thing_wih_changeset, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    thing_wih_changeset = CIT.get_thing_wih_changeset!(id)
    {:ok, _thing_wih_changeset} = CIT.delete_thing_wih_changeset(thing_wih_changeset)

    conn
    |> put_flash(:info, "Thing wih changeset deleted successfully.")
    |> redirect(to: thing_wih_changeset_path(conn, :index))
  end
end
