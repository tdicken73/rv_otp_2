defmodule DoubleTakeWeb.JumbotronLive do
  use DoubleTakeWeb, :live_view
  alias DoubleTake.Scores

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <h1>High Scores <%= @game %></h1>
      <pre><%= inspect(assigns, pretty: true) %></pre>
      <ul>
        <%= for {score, player} <- @arcade do %>
          <li><%= player %> - <%= score %></li>
        <% end %>
      </ul>
    </div>
    """
  end

  @impl true
  def handle_info({:update, _score, _playa}, socket) do
    {:noreply, socket |> update_scores(socket.assigns.game)}
  end

  @impl true
  def mount(%{"game" => game}, _session, socket) do
    if connected?(socket) do
      Scores.subscribe(game)
    end

    {:ok, socket |> assign(game: game) |> update_scores(game)}
  end

  defp update_scores(socket, game) do
    arcade = Scores.high_scores(game)
    assign(socket, arcade: arcade)
  end
end
