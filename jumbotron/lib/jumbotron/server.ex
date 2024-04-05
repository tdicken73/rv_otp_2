defmodule Jumbotron.Server do
  use GenServer
alias Jumbotron.Arcade
  # Callbacks

  def start_link(games) do
    GenServer.start_link(Jumbotron.Server, games, name: :arcade)
  end

  def add_score(pid \\ :arcade, game, {score, player}) do
    GenServer.cast(pid, {:add, game, score, player})
  end

  @impl true
  def init(games) do
    initial_state = Arcade.new(games)
    {:ok, initial_state}
  end

  @impl true
  def handle_call({:show, game}, _from, arcade) do

    {:reply, Arcade.show(arcade, game), arcade}
  end

  @impl true
  def handle_cast({:add, game, score, player}, arcade) do
    new_arcade = Arcade.add_score(arcade, game, {score, player})
    {:noreply, new_arcade}
  end

end
