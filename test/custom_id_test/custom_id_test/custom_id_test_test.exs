defmodule CustomIdTest.CustomIdTestTest do
  use CustomIdTest.DataCase

  alias CustomIdTest.CustomIdTest

  describe "things_with_changeset" do
    alias CustomIdTest.CustomIdTest.ThingWihChangeset

    @valid_attrs %{entry: "some entry"}
    @update_attrs %{entry: "some updated entry"}
    @invalid_attrs %{entry: nil}

    def thing_wih_changeset_fixture(attrs \\ %{}) do
      {:ok, thing_wih_changeset} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CustomIdTest.create_thing_wih_changeset()

      thing_wih_changeset
    end

    test "list_things_with_changeset/0 returns all things_with_changeset" do
      thing_wih_changeset = thing_wih_changeset_fixture()
      assert CustomIdTest.list_things_with_changeset() == [thing_wih_changeset]
    end

    test "get_thing_wih_changeset!/1 returns the thing_wih_changeset with given id" do
      thing_wih_changeset = thing_wih_changeset_fixture()
      assert CustomIdTest.get_thing_wih_changeset!(thing_wih_changeset.id) == thing_wih_changeset
    end

    test "create_thing_wih_changeset/1 with valid data creates a thing_wih_changeset" do
      assert {:ok, %ThingWihChangeset{} = thing_wih_changeset} = CustomIdTest.create_thing_wih_changeset(@valid_attrs)
      assert thing_wih_changeset.entry == "some entry"
    end

    test "create_thing_wih_changeset/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CustomIdTest.create_thing_wih_changeset(@invalid_attrs)
    end

    test "update_thing_wih_changeset/2 with valid data updates the thing_wih_changeset" do
      thing_wih_changeset = thing_wih_changeset_fixture()
      assert {:ok, thing_wih_changeset} = CustomIdTest.update_thing_wih_changeset(thing_wih_changeset, @update_attrs)
      assert %ThingWihChangeset{} = thing_wih_changeset
      assert thing_wih_changeset.entry == "some updated entry"
    end

    test "update_thing_wih_changeset/2 with invalid data returns error changeset" do
      thing_wih_changeset = thing_wih_changeset_fixture()
      assert {:error, %Ecto.Changeset{}} = CustomIdTest.update_thing_wih_changeset(thing_wih_changeset, @invalid_attrs)
      assert thing_wih_changeset == CustomIdTest.get_thing_wih_changeset!(thing_wih_changeset.id)
    end

    test "delete_thing_wih_changeset/1 deletes the thing_wih_changeset" do
      thing_wih_changeset = thing_wih_changeset_fixture()
      assert {:ok, %ThingWihChangeset{}} = CustomIdTest.delete_thing_wih_changeset(thing_wih_changeset)
      assert_raise Ecto.NoResultsError, fn -> CustomIdTest.get_thing_wih_changeset!(thing_wih_changeset.id) end
    end

    test "change_thing_wih_changeset/1 returns a thing_wih_changeset changeset" do
      thing_wih_changeset = thing_wih_changeset_fixture()
      assert %Ecto.Changeset{} = CustomIdTest.change_thing_wih_changeset(thing_wih_changeset)
    end
  end
end
