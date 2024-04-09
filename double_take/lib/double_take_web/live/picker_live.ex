defmodule DoubleTakeWeb.PickerLive do
  use DoubleTakeWeb, :live_view
  alias DoubleTake.Library

  def mount(_params, _session, socket) do
    q = Library.first_quotation()

    {:ok, assign(socket, quotation:  q)}
  end

  def render(assigns) do
    ~H"""
    <h1>Choose</h1>
    """
  end

end
