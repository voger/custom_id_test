defmodule CustomIdTestWeb.ThingWihChangesetControllerTest do
  use CustomIdTestWeb.ConnCase

  alias CustomIdTest.CustomIdTest

  @create_attrs %{entry: "some entry"}
  @update_attrs %{entry: "some updated entry"}
  @invalid_attrs %{entry: nil}

  def fixture(:thing_wih_changeset) do
    {:ok, thing_wih_changeset} = CustomIdTest.create_thing_wih_changeset(@create_attrs)
    thing_wih_changeset
  end

  describe "index" do
    test "lists all things_with_changeset", %{conn: conn} do
      conn = get conn, thing_wih_changeset_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Things with changeset"
    end
  end

  describe "new thing_wih_changeset" do
    test "renders form", %{conn: conn} do
      conn = get conn, thing_wih_changeset_path(conn, :new)
      assert html_response(conn, 200) =~ "New Thing wih changeset"
    end
  end

  describe "create thing_wih_changeset" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, thing_wih_changeset_path(conn, :create), thing_wih_changeset: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == thing_wih_changeset_path(conn, :show, id)

      conn = get conn, thing_wih_changeset_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Thing wih changeset"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, thing_wih_changeset_path(conn, :create), thing_wih_changeset: @invalid_attrs
      assert html_response(conn, 200) =~ "New Thing wih changeset"
    end
  end

  describe "edit thing_wih_changeset" do
    setup [:create_thing_wih_changeset]

    test "renders form for editing chosen thing_wih_changeset", %{conn: conn, thing_wih_changeset: thing_wih_changeset} do
      conn = get conn, thing_wih_changeset_path(conn, :edit, thing_wih_changeset)
      assert html_response(conn, 200) =~ "Edit Thing wih changeset"
    end
  end

  describe "update thing_wih_changeset" do
    setup [:create_thing_wih_changeset]

    test "redirects when data is valid", %{conn: conn, thing_wih_changeset: thing_wih_changeset} do
      conn = put conn, thing_wih_changeset_path(conn, :update, thing_wih_changeset), thing_wih_changeset: @update_attrs
      assert redirected_to(conn) == thing_wih_changeset_path(conn, :show, thing_wih_changeset)

      conn = get conn, thing_wih_changeset_path(conn, :show, thing_wih_changeset)
      assert html_response(conn, 200) =~ "some updated entry"
    end

    test "renders errors when data is invalid", %{conn: conn, thing_wih_changeset: thing_wih_changeset} do
      conn = put conn, thing_wih_changeset_path(conn, :update, thing_wih_changeset), thing_wih_changeset: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Thing wih changeset"
    end
  end

  describe "delete thing_wih_changeset" do
    setup [:create_thing_wih_changeset]

    test "deletes chosen thing_wih_changeset", %{conn: conn, thing_wih_changeset: thing_wih_changeset} do
      conn = delete conn, thing_wih_changeset_path(conn, :delete, thing_wih_changeset)
      assert redirected_to(conn) == thing_wih_changeset_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, thing_wih_changeset_path(conn, :show, thing_wih_changeset)
      end
    end
  end

  defp create_thing_wih_changeset(_) do
    thing_wih_changeset = fixture(:thing_wih_changeset)
    {:ok, thing_wih_changeset: thing_wih_changeset}
  end
end
