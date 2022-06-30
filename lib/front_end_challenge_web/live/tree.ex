defmodule FrontEndChallengeWeb.Tree do
  use Surface.LiveView

  alias FrontEndChallengeWeb.Components.{Hierarchy, MyButton, Hero, MyGraph}
  alias Surface.Components.Form
  alias Surface.Components.Form.Select
  alias FrontEndChallenge.TreeGraph

  data department, :list,
    default: [
      %{role: "manager A", warrant: "300", level: 1},
      %{role: "manager B", warrant: "300", level: 2},
      %{role: "developer", warrant: "1000", level: 3},
      %{role: "QA tester", warrant: "800", level: 3}
    ]

  data employees, :list,
    default: [
      %{id: 0, role: :manager},
      %{id: 2, role: :manager, parent_id: 0},
      %{id: 3, role: :developer, parent_id: 2},
      %{id: 4, role: :qa_tester, parent_id: 2}
    ]

  data message, :string, default: "Add Graph "
  data paths, :list, default: []
  data yo, :list, default: [1,1,2,2,]
  data graph, :struct, default: Graph.new
  data vertex, :integer, default: 0 

  def render(assigns) do
    ~F"""
    
    <MyGraph message = {@message} id= "message" employees={@employees} graph={@graph} vertex={@vertex}>

    </MyGraph>

    <Hero message={@message} id= "message"/>
    """
  end



end
