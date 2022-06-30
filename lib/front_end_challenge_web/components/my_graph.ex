defmodule FrontEndChallengeWeb.Components.MyGraph do
  use Surface.LiveComponent
  alias FrontEndChallenge.TreeGraph
  alias FrontEndChallengeWeb.Components.Hero
  prop loading, :boolean
  prop rounded, :boolean
  prop click, :event

  slot default

  data count, :string, default: "0"
  prop message, :string
  prop employees, :list 
  prop paths, :list, default: []
  prop graph, :struct
  prop vertex, :integer, required: true



  def render(assigns) do
    ~F"""
    <div>
    {@message}
    </div>
    <div>
  
    {#for child <- Graph.in_neighbors(@graph, @vertex)}
    {TreeGraph.label_vertex(@graph,child)} with id: 
    {child}
    {#else}
    No items in graph
    {/for}


    </div>

    <button
      class={"button", "is-info"}
  
      phx-click="close"
      phx-target= "#message"
      :on-click="add_graph"
    >
      <#slot /> 
     {@message}
    </button>
    """
  end


  def handle_event("add_graph", _, socket) do
    graph = Graph.new
    graph = TreeGraph.add_vertices(graph, socket.assigns.employees)
    graph = TreeGraph.add_edges(graph, socket.assigns.employees)
    
    paths = Elixir.Graph.Reducers.Bfs.reduce(graph, [], fn 0, acc -> {:halt, acc}; v, acc -> {:next, [v|acc]} end)
    message = "add other"

    # Hero.show("message")

    {:noreply, assign(socket, 
    message:  message,
    paths: paths,
    graph: graph
    )}
  end

  defp render_node(assigns,graph) do
    ~F"""
    {#for child <- Graph.in_neighbors(graph, 0)}
    {child}

    {#else}
    No items in graph
    {/for}
    """
  end
  
end
