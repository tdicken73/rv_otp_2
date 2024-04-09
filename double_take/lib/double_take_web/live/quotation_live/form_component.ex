defmodule DoubleTakeWeb.QuotationLive.FormComponent do
  use DoubleTakeWeb, :live_component

  alias DoubleTake.Library

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage quotation records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="quotation-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:steps]} type="number" label="Steps" />
        <.input field={@form[:text]} type="text" label="Text" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Quotation</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{quotation: quotation} = assigns, socket) do
    changeset = Library.change_quotation(quotation)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"quotation" => quotation_params}, socket) do
    changeset =
      socket.assigns.quotation
      |> Library.change_quotation(quotation_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"quotation" => quotation_params}, socket) do
    save_quotation(socket, socket.assigns.action, quotation_params)
  end

  defp save_quotation(socket, :edit, quotation_params) do
    case Library.update_quotation(socket.assigns.quotation, quotation_params) do
      {:ok, quotation} ->
        notify_parent({:saved, quotation})

        {:noreply,
         socket
         |> put_flash(:info, "Quotation updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_quotation(socket, :new, quotation_params) do
    case Library.create_quotation(quotation_params) do
      {:ok, quotation} ->
        notify_parent({:saved, quotation})

        {:noreply,
         socket
         |> put_flash(:info, "Quotation created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
