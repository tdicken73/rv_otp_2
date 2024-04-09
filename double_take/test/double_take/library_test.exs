defmodule DoubleTake.LibraryTest do
  use DoubleTake.DataCase

  alias DoubleTake.Library

  describe "quotations" do
    alias DoubleTake.Library.Quotation

    import DoubleTake.LibraryFixtures

    @invalid_attrs %{name: nil, text: nil, steps: nil}

    test "list_quotations/0 returns all quotations" do
      quotation = quotation_fixture()
      assert Library.list_quotations() == [quotation]
    end

    test "get_quotation!/1 returns the quotation with given id" do
      quotation = quotation_fixture()
      assert Library.get_quotation!(quotation.id) == quotation
    end

    test "create_quotation/1 with valid data creates a quotation" do
      valid_attrs = %{name: "some name", text: "some text", steps: 42}

      assert {:ok, %Quotation{} = quotation} = Library.create_quotation(valid_attrs)
      assert quotation.name == "some name"
      assert quotation.text == "some text"
      assert quotation.steps == 42
    end

    test "create_quotation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_quotation(@invalid_attrs)
    end

    test "update_quotation/2 with valid data updates the quotation" do
      quotation = quotation_fixture()
      update_attrs = %{name: "some updated name", text: "some updated text", steps: 43}

      assert {:ok, %Quotation{} = quotation} = Library.update_quotation(quotation, update_attrs)
      assert quotation.name == "some updated name"
      assert quotation.text == "some updated text"
      assert quotation.steps == 43
    end

    test "update_quotation/2 with invalid data returns error changeset" do
      quotation = quotation_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_quotation(quotation, @invalid_attrs)
      assert quotation == Library.get_quotation!(quotation.id)
    end

    test "delete_quotation/1 deletes the quotation" do
      quotation = quotation_fixture()
      assert {:ok, %Quotation{}} = Library.delete_quotation(quotation)
      assert_raise Ecto.NoResultsError, fn -> Library.get_quotation!(quotation.id) end
    end

    test "change_quotation/1 returns a quotation changeset" do
      quotation = quotation_fixture()
      assert %Ecto.Changeset{} = Library.change_quotation(quotation)
    end
  end
end
