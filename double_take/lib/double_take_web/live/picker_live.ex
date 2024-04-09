defmodule DoubleTakeWeb.PickerLive do
  use DoubleTakeWeb, :live_view
  alias DoubleTake.Library

  @impl true
  def mount(_params, _session, socket) do
    q = Library.first_quotation()

    {:ok, assign(socket, quotation:  q)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <h1>Choose</h1>
    <div>
      <p><%= @quotation.text %></p>
      <p><%= @quotation.name %></p>
      <p><%= @quotation.steps %></p>
    </div>
    <div>
      <button phx-click="next">Next</button>
      <button phx-click="choose">Choose</button>
    </div>

    """
  end

  @impl true
  def handle_event("next", _params, socket) do
    q = Library.next_quotation(socket.assigns.quotation)
    {:noreply, assign(socket, quotation: q)}
  end


  def handle_event("choose", _params, socket) do
    {
      :noreply,
      socket
      |> push_redirect(to: ~p"/play/#{socket.assigns.quotation.id}")
    }
  end

end
