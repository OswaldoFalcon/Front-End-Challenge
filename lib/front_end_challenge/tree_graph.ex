defmodule FrontEndChallenge.TreeGraph do
   @moduledoc """
  This is the TreeGraph module.
  This module have diferrent functions tu build a Hierarchy Tree 
  with libgraph.
  You have to use a List of maps.
  [
    %{id: 0, role: :manager},
    %{id: 2, role: :manager, parent_id: 0},
    %{id: 3, role: :developer, parent_id: 2},
    %{id: 4, role: :qa_tester, parent_id: 2}
  ]
  """
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
    id = Enum.map(employees, fn employee -> employee.id end) |> Enum.reduce(&max/2)

    [%{id: id + 1, role: role, parent_id: parent_id} | Enum.reverse(employees)]
    |> Enum.reverse()
  end

  def get_manager_vertex(employees) do
    employees
    |> Enum.filter(fn employee -> employee.role == :manager and employee.id != 0 end)
    |> Enum.map(fn manager -> manager.id end)
  end

  def label_vertex(graph, vertex) do
    role = Graph.vertex_labels(graph, vertex) |> List.first() |> Atom.to_string()

    space =
      Enum.map(1..((Graph.get_paths(graph, vertex, 0) |> List.flatten() |> length) * 3), fn _ ->
        "."
      end)
      |> List.to_string()

    space <> role
  end

  def build_graph(data) do
    Graph.new()
    |> add_vertices(data)
    |> add_edges(data)
  end 

  defmodule TreeBuilder do
     @moduledoc """
    This is the MyGraph Module
    Print the Tree in Terminal
  """
    def build(graph, vertex) do
      children =
        for child <- Graph.in_neighbors(graph, vertex) do
          space = Enum.map(1..((vertex + 1) * 3), fn _ -> "." end) |> List.to_string()
          space <> Integer.to_string(child) <> "son of " <> Integer.to_string(vertex)
          build(graph, child)
        end

      label = Graph.vertex_labels(graph, vertex)

      Map.put(%{role: label}, :children, children)
    end
  end
end
