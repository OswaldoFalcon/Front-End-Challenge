defmodule FrontEndChallengeWeb.Tree do
  @moduledoc """
  This is the Tree Module
  Use Surface to build UI.
  """
  use Surface.LiveView

  alias FrontEndChallengeWeb.Components.{MyGraph}

  data employees, :list,
    default: [
      %{id: 0, role: :manager}
    ]

  data graph, :struct, default: Graph.new()
  data vertex, :list, default: []

  def render(assigns) do
    ~F"""
    <MyGraph employees={@employees} graph={@graph} vertex={@vertex} id="graph">
    </MyGraph>
    """
  end
end
