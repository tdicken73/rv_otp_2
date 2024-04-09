defmodule DoubleTakeWeb.EraserLive do
  use DoubleTakeWeb, :live_view
  alias DoubleTake.Library
  alias DoubleTake.Eraser

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <h1>Play <%= @eraser.name %> <%= @eraser.score %></h1>
      <p><%= @eraser.text %></p>
      <.game_over score={@eraser.score} over={@eraser.plan == []}>
        <button phx-click="erase" phx-value-text="123">Erase 123</button>
      </.game_over>
    </div>
    """
  end

  defp erase(socket, params) do
    eraser =
      socket.assigns.eraser
      |> Eraser.erase(params["text"] || "123")

    assign(socket, eraser: eraser)
  end

  @impl true
  def mount(%{"quotation_id" => id}, _session, socket) do
    quotation = Library.get_quotation!(id)
    eraser = Eraser.new(quotation)
    {:ok, socket |> assign(eraser: eraser)}
  end

  @impl true
  def handle_event("erase", params, socket) do
    {:noreply, socket |> erase(params)}
  end

  attr :over, :boolean
  slot :inner_block
  attr :score, :integer

  def game_over(assigns) do
    ~H"""
    <div>
      <%= if @over do %>
        <h1>Game Over</h1>
        <p>Your score: <%= @score %></p>
        <button phx-click="restart">Restart</button>
      <% else %>
        <%= render_slot(@inner_block) %>
      <% end %>
    </div>
    """
  end
end
