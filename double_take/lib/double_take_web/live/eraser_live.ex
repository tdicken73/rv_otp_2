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
        <.simple_form
        for={@form}
        id="guess-form"
        phx-change="validate"
        phx-submit="erase"
        >
          <.input field={@form[:text]} type="text" label="Text" />
          <:actions>
            <.button phx-disable-with="Erasing...">Erase</.button>
          </:actions>
        </.simple_form>
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
    {:ok, socket |> assign(eraser: eraser) |> assign_form(%{})}
  end

  @impl true
  def handle_event("erase", %{"quotation_form" => params}, socket) do
    {:noreply, socket |> erase(params)}
  end

  def handle_event("validate", %{"quotation_form" => params}, socket) do
    {:noreply, socket |> assign_form(params)}
  end

  def assign_form(socket, params) do
    form = params
    |> QuotationForm.changeset()
    |> to_form()

    assign(socket, form: form)
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
