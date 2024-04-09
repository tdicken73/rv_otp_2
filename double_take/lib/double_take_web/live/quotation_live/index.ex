defmodule DoubleTakeWeb.QuotationLive.Index do
  use DoubleTakeWeb, :live_view

  alias DoubleTake.Library
  alias DoubleTake.Library.Quotation

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :quotations, Library.list_quotations())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Quotation")
    |> assign(:quotation, Library.get_quotation!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Quotation")
    |> assign(:quotation, %Quotation{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Quotations")
    |> assign(:quotation, nil)
  end

  @impl true
  def handle_info({DoubleTakeWeb.QuotationLive.FormComponent, {:saved, quotation}}, socket) do
    {:noreply, stream_insert(socket, :quotations, quotation)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    quotation = Library.get_quotation!(id)
    {:ok, _} = Library.delete_quotation(quotation)

    {:noreply, stream_delete(socket, :quotations, quotation)}
  end
end
