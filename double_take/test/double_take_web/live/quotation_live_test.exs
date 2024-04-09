defmodule DoubleTakeWeb.QuotationLiveTest do
  use DoubleTakeWeb.ConnCase

  import Phoenix.LiveViewTest
  import DoubleTake.LibraryFixtures

  @create_attrs %{name: "some name", text: "some text", steps: 42}
  @update_attrs %{name: "some updated name", text: "some updated text", steps: 43}
  @invalid_attrs %{name: nil, text: nil, steps: nil}

  defp create_quotation(_) do
    quotation = quotation_fixture()
    %{quotation: quotation}
  end

  describe "Index" do
    setup [:create_quotation]

    test "lists all quotations", %{conn: conn, quotation: quotation} do
      {:ok, _index_live, html} = live(conn, ~p"/quotations")

      assert html =~ "Listing Quotations"
      assert html =~ quotation.name
    end

    test "saves new quotation", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/quotations")

      assert index_live |> element("a", "New Quotation") |> render_click() =~
               "New Quotation"

      assert_patch(index_live, ~p"/quotations/new")

      assert index_live
             |> form("#quotation-form", quotation: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#quotation-form", quotation: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/quotations")

      html = render(index_live)
      assert html =~ "Quotation created successfully"
      assert html =~ "some name"
    end

    test "updates quotation in listing", %{conn: conn, quotation: quotation} do
      {:ok, index_live, _html} = live(conn, ~p"/quotations")

      assert index_live |> element("#quotations-#{quotation.id} a", "Edit") |> render_click() =~
               "Edit Quotation"

      assert_patch(index_live, ~p"/quotations/#{quotation}/edit")

      assert index_live
             |> form("#quotation-form", quotation: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#quotation-form", quotation: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/quotations")

      html = render(index_live)
      assert html =~ "Quotation updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes quotation in listing", %{conn: conn, quotation: quotation} do
      {:ok, index_live, _html} = live(conn, ~p"/quotations")

      assert index_live |> element("#quotations-#{quotation.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#quotations-#{quotation.id}")
    end
  end

  describe "Show" do
    setup [:create_quotation]

    test "displays quotation", %{conn: conn, quotation: quotation} do
      {:ok, _show_live, html} = live(conn, ~p"/quotations/#{quotation}")

      assert html =~ "Show Quotation"
      assert html =~ quotation.name
    end

    test "updates quotation within modal", %{conn: conn, quotation: quotation} do
      {:ok, show_live, _html} = live(conn, ~p"/quotations/#{quotation}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Quotation"

      assert_patch(show_live, ~p"/quotations/#{quotation}/show/edit")

      assert show_live
             |> form("#quotation-form", quotation: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#quotation-form", quotation: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/quotations/#{quotation}")

      html = render(show_live)
      assert html =~ "Quotation updated successfully"
      assert html =~ "some updated name"
    end
  end
end
