defmodule FrontEndChallenge.TreeGraph do

  [
    %{id: 0, role: :manager},
    %{id: 2, role: :manager, parent_id: 0},
    %{id: 3, role: :developer, parent_id: 2},
    %{id: 4, role: :qa_tester, parent_id: 2}
  ]

  # graph = Graph.new
  # Add vertices and label
  def add_vertices(graph, employees) do
    Enum.reduce(employees, graph, fn node, graph ->
      Graph.add_vertex(graph, node.id, node.role)
    end)
  end

  # Add edges
  def add_edges(graph, employees) do
    edges = Enum.map(tl(employees), fn node -> {node.id, node.parent_id} end)
    Graph.add_edges(graph, edges)
  end

  # path
  def get_paths(graph, employees, from, to) do
    Graph.get_paths(graph, from, to)
    |> List.flatten()
    |> Enum.map(fn id -> Enum.at(employees, id) |> Map.get(:role) end)
  end

  def add_employee(employees, parent_id, role) do
    [%{id: length(employees), role: role, parent_id: parent_id} | Enum.reverse(employees)]
    |> Enum.reverse()
  end

  def label_vertex(graph,vertex) do
    Graph.vertex_labels(graph, vertex) |> List.first |> Atom.to_string
  end

  
  # addd moere  

  defmodule TreeBuilder do
    def build(graph, vertex) do
      children = 
        for child <- Graph.in_neighbors(graph, vertex) do
          space = Enum.map(1..(vertex + 1) * 3 , fn dot -> "." end) |> List.to_string
          chi = space <>  Integer.to_string(child) <> "son of " <> Integer.to_string(vertex)
          build(graph, child) 
        end

      label = Graph.vertex_labels(graph, vertex)

      Map.put(%{role: label}, :children, children)

    end
  end
end
