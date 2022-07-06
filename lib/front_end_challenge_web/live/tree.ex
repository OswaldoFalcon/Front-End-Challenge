defmodule FrontEndChallengeWeb.Tree do
  @moduledoc """
  This is the Tree Module
  Use Surface to build UI.
  """
  use Surface.LiveView

  alias FrontEndChallengeWeb.Components.{MyGraph, Total}

  data employees, :list,
    default: [
      %{id: 0, role: :manager}
    ]

  data graph, :struct, default: Graph.new()
  data vertex, :list, default: []
  data allocation, :integer, default: 0

  def render(assigns) do
    ~F"""
    <Total>
      Total allocation : {@allocation}
    </Total>
    <MyGraph employees={@employees} graph={@graph} vertex={@vertex} id="graph">
    </MyGraph>
    """
  end

  def handle_info({:allocation, allocation}, socket) do
    {:noreply,
     assign(socket,
       allocation: allocation
     )}
  end
end
