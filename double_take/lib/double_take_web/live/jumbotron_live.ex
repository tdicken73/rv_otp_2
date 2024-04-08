defmodule DoubleTakeWeb.JumbotronLive do
  use DoubleTakeWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <h1>High Scores <%= @game %></h1>
      <pre><%= inspect(assigns, pretty: true) %></pre>
    </div>
    """
  end

  @impl true
  def mount(%{"game" => game}, _session, socket) do
    arcade = Jumbotron.as_list(game)
    {:ok, assign(socket, arcade: arcade, game: game)}
  end
end
